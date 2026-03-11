CLASS lhc_Header DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Header RESULT result.

    METHODS ProcessScannedBatch FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Header~ProcessScannedBatch.
ENDCLASS.

CLASS lhc_Header IMPLEMENTATION.
  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD ProcessScannedBatch.
    READ ENTITIES OF ZI_ScanHeader IN LOCAL MODE
         ENTITY Header
         FIELDS ( ScannedBatch ) WITH CORRESPONDING #( keys )
         RESULT DATA(lt_header).

    LOOP AT lt_header ASSIGNING FIELD-SYMBOL(<fs_header>).
      IF <fs_header>-ScannedBatch IS NOT INITIAL.
        
        " Create Item
        MODIFY ENTITIES OF ZI_ScanHeader IN LOCAL MODE
               ENTITY Header
               CREATE BY \_Item
               FIELDS ( BatchNumber Quantity )
               WITH VALUE #( ( 
                 %tky = <fs_header>-%tky
                 %target = VALUE #( ( 
                   %is_draft = <fs_header>-%is_draft
                   BatchNumber = <fs_header>-ScannedBatch
                   Quantity    = 1 
                 ) ) 
               ) ).
               
        " Clear ScannedBatch field
        MODIFY ENTITIES OF ZI_ScanHeader IN LOCAL MODE
               ENTITY Header
               UPDATE FIELDS ( ScannedBatch )
               WITH VALUE #( ( 
                 %tky = <fs_header>-%tky
                 ScannedBatch = '' 
               ) ).
      ENDIF.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
