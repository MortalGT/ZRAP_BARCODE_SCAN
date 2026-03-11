# RAP Application for Barcode Scanner
This folder (`ZRAP_BARCODE_SCAN`) contains all the necessary ABAP artifacts to create the **Barcode Scanner RAP Application** as per the blueprint.

## Steps to Deploy this to your SAP System:

1. **Tables**: Create two Transparent Tables in Eclipse ADT `ZSCAN_HDR` and `ZSCAN_ITM`. Copy and paste the definitions from `zscan_hdr.tabl` and `zscan_itm.tabl`. Activate them.
   *(Make sure to create lock objects or just rely on RAP draft locks!)*
2. **CDS Views**: 
   - Create Data Definition `ZI_SCANHEADER` and paste content from `ZI_ScanHeader.ddls.asddls`.
   - Create Data Definition `ZI_SCANITEM` and paste content from `ZI_ScanItem.ddls.asddls`.
3. **Behavior Definition**: 
   - Create Behavior Definition `ZI_SCANHEADER` and paste content from `ZI_ScanHeader.bdef.asbdef`.
4. **Behavior Implementation**:
   - Create ABAP Class `ZBP_I_SCAN_HEADER` and paste content from `zbp_i_scan_header.clas.abap` in the Global class view.
   - Switch to the "Local Types" tab in your ABAP class and paste the content from `zbp_i_scan_header.clas.locals_imp.abap`.
5. **Projection Views**:
   - Create Data Definition `ZC_SCANHEADER` and paste content from `ZC_ScanHeader.ddls.asddls`.
   - Create Data Definition `ZC_SCANITEM` and paste content from `ZC_ScanItem.ddls.asddls`.
6. **Projection Behavior Definition**:
   - Create Behavior Definition `ZC_SCANHEADER` (as projection) - I left out the source for this, you can auto-generate it in Eclipse and add `use draft;` and `use association _Item;`.
7. **Service Definition**:
   - Create Service Definition `ZUI_SCANHEADER` and paste content from `ZUI_SCANHEADER.srvd.assrvd`.
8. **Service Binding**:
   - Right-click `ZUI_SCANHEADER` -> New Service Binding -> OData V4 (binding type `OData V4 - UI`). Activate and Publish it.

Once the service is published, you can use the "Preview" button in the Service Binding in Eclipse ADT to test the Fiori Elements application instantly!

> **Why a new folder?**
> Since the Fiori Application requires the backend OData service to exist first before running `npx @sap/create-fiori-app`, the necessary order of operations is to create the backend ABAP CDS/RAP objects first!
