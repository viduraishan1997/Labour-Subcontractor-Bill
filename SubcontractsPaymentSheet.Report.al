report 50191 "Subcontracts Payment Sheet"
{
    DefaultLayout = RDLC;
    RDLCLayout = './SubcontractsPaymentSheet.rdlc';

    dataset
    {
        dataitem(DataItem1000000000; Table50048)
        {
            RequestFilterFields = "Autho. No. Display";
            column(PRNo_MeasurementSheetHeader; PrCrNo)
            {
            }
            column(OutstandingRecoRemarks; "Measurement Sheet Header"."Outstanding Reco. Remarks")
            {
            }
            column(ChequeVoided; "Measurement Sheet Header"."Cheque Voided")
            {
            }
            column(HiddenVar; HiddenVar)
            {
            }
            column(ChequeVoidedRemarks; "Measurement Sheet Header"."Cheque Voided Remarks")
            {
            }
            column(ForeignCurrencyText; ForeignCurrencyText)
            {
            }
            dataitem(DataItem1000000001; Table50017)
            {
                DataItemLink = Project Code=FIELD(Shortcut Dimension 2 Code);
                DataItemTableView = SORTING (Item Code, Project Code, Main Item Code);
                column(AuthNo; AuthoNo)
                {
                }
                column(ItemCode; "Sub Item Project Rate"."Item Code")
                {
                }
                column(ItemName; "Sub Item Project Rate"."Item Description")
                {
                }
                column(ItemAmount; ItemAmount)
                {
                }
                column(MainItem; "Sub Item Project Rate"."Main Item Code")
                {
                }
                column(Project; Project)
                {
                }
                column(Date; MeasurementSheetHeader."Date To")
                {
                }
                column(SubiName; SubiName)
                {
                }
                column(SubiAddr; SubiAddr)
                {
                }
                column(Contract_txt; Contract_txt)
                {
                }
                column(HOQs; HOQs)
                {
                }
                column(PrepBy; PrepBy)
                {
                }
                column(GM; GM)
                {
                }
                column(PM; PM)
                {
                }
                column(ThisAdvance; ThisAdvance)
                {
                }
                column(RetentionRelease; RetentionRelease)
                {
                }
                column(DirLbrAmt; DirLbrAmt)
                {
                }
                column(MatDeduction; MatDeduction)
                {
                }
                column(FineDeductionAmt; FineDeductionAmt)
                {
                }
                column(Retention; Retention)
                {
                }
                column(OtherDeductionsAmt; OtherDeductionsAmt)
                {
                }
                column(OutsAdvance; OutsAdvance)
                {
                }
                column(WhtPercentage; MeasurementSheetHeader."WHT Amount")
                {
                }
                column(ItemAmount_Cum; ItemAmount_Cum)
                {
                }
                column(ThisAdvance_CUM; ThisAdvance_CUM)
                {
                }
                column(RetentionRelease_CUM; RetentionRelease_CUM)
                {
                }
                column(DirLbrAmt_CUM; DirLbrAmt_CUM)
                {
                }
                column(MatDeduction_CUM; MatDeduction_CUM)
                {
                }
                column(FineDeductionAmt_CUM; FineDeductionAmt_CUM)
                {
                }
                column(Retention_CUM; Retention_CUM)
                {
                }
                column(OtherDeductionsAmt_CUM; OtherDeductionsAmt_CUM)
                {
                }
                column(OutsAdvance_CUM; OutsAdvance_CUM)
                {
                }
                column(WHT_CUM; WHT_CUm)
                {
                }
                column(VATAmt; VATAmt)
                {
                }
                column(VATAmt_CUM; VATAmt_CUM)
                {
                }
                column(SSCAmt; SSCAmt)
                {
                }
                column(SSCAmt_CUM; SSCAmt_CUM)
                {
                }
                column(TaxGroup; MeasurementSheetHeader."TAX Group")
                {
                }
                column(LoanPaid; LoanPaid)
                {
                }
                column(LoanRecov; LoanRecov)
                {
                }
                column(LoanPaid_CUM; LoanPaid_CUM)
                {
                }
                column(LoanRecov_CUM; LoanRecov_CUM)
                {
                }
                column(NIC; NIC)
                {
                }
                column(MobiAdvancePaid; MobiAdvancePaid)
                {
                }
                column(MobiAdvancePaid_CUM; MobiAdvancePaid_CUM)
                {
                }
                column(MobiAdvanceRecoverd; MobiAdvanceRecoverd)
                {
                }
                column(MobiAdvanceRecoverd_CUM; MobiAdvanceRecoverd_CUM)
                {
                }
                column(IsSpecialSubCOntractor; IsSpecialSubCOntractor)
                {
                }
                column(SpeSubiDis; SpeSubiDis)
                {
                }
                column(SpText; SpText)
                {
                }
                column(MOSAdition; MOSAdition)
                {
                }
                column(MOSAdition_CUM; MOSAdition_CUM)
                {
                }
                column(MOSDed; MOSDed)
                {
                }
                column(MOSDed_CUM; MOSDed_CUM)
                {
                }
                column(LCDed; LCDed)
                {
                }
                column(LCDed_CUM; LCDed_CUM)
                {
                }
                column(OutsRecoverd; OutsRecoverd)
                {
                }
                column(OutsRecoverd_CUM; OutsRecoverd_CUM)
                {
                }
                column(RecMat; RecMat)
                {
                }
                column(RecMat_CUM; RecMat_CUM)
                {
                }
                column(RecPPE; RecPPE)
                {
                }
                column(RecPPE_CUM; RecPPE_CUM)
                {
                }
                column(RecST; RecST)
                {
                }
                column(RecST_CUM; RecST_CUM)
                {
                }
                column(SubMatDed_msc; SubMatDed_msc)
                {
                }
                column(SubMatDed_CUM_msc; SubMatDed_CUM_msc)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    //0850/YGRY/8

                    ItemAmount := 0;
                    ItemAmount_Cum := 0;

                    ItemAmount_Cum := GetCumAmt(ProjCode, SubCOnCode, "Sub Item Project Rate"."Item Code", MesureSheeAuthotNo, MeasurementSheetHeader."SUb. CodeInt");



                    //50049 repeat
                    MeasurementSheetLine.RESET;
                    MeasurementSheetLine.SETRANGE("Document No.", "Measurement Sheet Header"."No.");
                    MeasurementSheetLine.SETRANGE("Item Code", "Sub Item Project Rate"."Item Code");

                    MeasurementSheetLine.SETRANGE(Cancel, FALSE);

                    IF MeasurementSheetLine.FINDSET THEN
                        REPEAT
                            ItemAmount += MeasurementSheetLine."This Amount";
                        UNTIL MeasurementSheetLine.NEXT = 0;

                    //Get from SP Subcontractor Bill Lines 28-05-2020 by heaven
                    "SP Subcontractor Bill Lines".RESET;
                    "SP Subcontractor Bill Lines".CALCFIELDS("Item Code");
                    "SP Subcontractor Bill Lines".SETRANGE("Measure. No.", "Measurement Sheet Header"."No.");
                    "SP Subcontractor Bill Lines".SETRANGE("Item Code", "Sub Item Project Rate"."Item Code");
                    "SP Subcontractor Bill Lines".SETRANGE(Cancel, FALSE);//Sanka cancel bill ignore 2020-06-24
                    IF "SP Subcontractor Bill Lines".FINDSET THEN
                        REPEAT
                            ItemAmount += "SP Subcontractor Bill Lines"."This Bill Amount";
                        UNTIL "SP Subcontractor Bill Lines".NEXT = 0;
                    //Get from SP Subcontractor Bill Lines 28-05-2020 by heaven

                    //50186 repeat
                    SubBillTempItemsLine.RESET;
                    SubBillTempItemsLine.SETRANGE("Mes.Sheet No", "Measurement Sheet Header"."No.");
                    SubBillTempItemsLine.SETRANGE("Item Code", "Sub Item Project Rate"."Item Code");
                    //SubBillTempItemsLine.SETRANGE("PM Approval",FALSE);

                    IF SubBillTempItemsLine.FINDSET THEN
                        REPEAT
                            SubBillTempItemsLine.CALCFIELDS(SubBillTempItemsLine."Item Amount");
                            ItemAmount += SubBillTempItemsLine."Item Amount";
                        UNTIL SubBillTempItemsLine.NEXT = 0;

                    //50187 repeat
                    SubcontractorLabourSupply.RESET;
                    SubcontractorLabourSupply.SETRANGE("Measure. No.", "Measurement Sheet Header"."No.");
                    SubcontractorLabourSupply.SETRANGE("Item Code", "Sub Item Project Rate"."Item Code");
                    SubcontractorLabourSupply.SETRANGE(Cancel, FALSE);

                    IF SubcontractorLabourSupply.FINDSET THEN
                        REPEAT
                            ItemAmount += SubcontractorLabourSupply.Amount;
                        UNTIL SubcontractorLabourSupply.NEXT = 0;

                    //SANKA 2018-12-26
                    //T-50203 Repeat
                    SubSPWorkers.RESET;
                    SubSPWorkers.SETRANGE("Measure. No.", "Measurement Sheet Header"."No.");
                    SubSPWorkers.SETRANGE("Item Code", "Sub Item Project Rate"."Item Code");
                    SubSPWorkers.SETRANGE("Cheque Voided", FALSE); // cancelled bill added on 2020-06-23   Sanka
                    IF SubSPWorkers.FINDSET THEN
                        REPEAT
                            ItemAmount += SubSPWorkers.Amount;
                        UNTIL SubSPWorkers.NEXT = 0;

                    IF IsCheckVoided THEN BEGIN
                        ItemAmount := 0.0;
                        ThisAdvance := 0.0;
                        MobiAdvancePaid := 0.0;
                        RetentionRelease := 0.0;
                        DirLbrAmt := 0.0;
                        LoanPaid := 0.0;
                        MOSAdition := 0.0;
                        OutsAdvance := 0.0;
                        MobiAdvanceRecoverd := 0.0;
                        MatDeduction := 0.0;
                        FineDeductionAmt := 0.0;
                        Retention := 0.0;
                        OtherDeductionsAmt := 0.0;
                        LoanRecov := 0.0;
                        MOSDed := 0.0;
                        LCDed := 0.0;
                        OutsRecoverd := 0.0;
                        VATAmt := 0.0;
                        WhtPercentage := 0.0;
                        MeasurementSheetHeader."WHT Amount" := 0;
                    END;
                end;

                trigger OnPreDataItem()
                begin
                    MesureSheeAuthotNo := 0;

                    MeasurementSheetHeader.RESET;
                    MeasurementSheetHeader.SETRANGE(MeasurementSheetHeader."No.", "Measurement Sheet Header"."No.");
                    IF MeasurementSheetHeader.FINDFIRST THEN BEGIN
                        MesureSheeAuthotNo := MeasurementSheetHeader."Autho No";
                    END;

                    //SANKA 2019-03-16 RT #7666
                    IF MeasurementSheetHeader."Cheque Voided" THEN
                     // ERROR('Payment Was Cancelled You cannot take Authority Report, Use Bill Sheet report if required..');
                end;
            }

            trigger OnAfterGetRecord()
            begin
                IsCheckVoided := FALSE;
                HiddenVar := 'normal';

                IsCheckVoided := "Measurement Sheet Header"."Cheque Voided";
                IF IsCheckVoided THEN
                    HiddenVar := 'HIDE';

                //SANKA RT 7655 on 2019-03-19
                PrCrNo := '';


                IF "Measurement Sheet Header"."Credit Memo No" <> '' THEN
                    PrCrNo := "Measurement Sheet Header"."Credit Memo No"
                ELSE
                    IF "Measurement Sheet Header"."PR No." <> '' THEN
                        PrCrNo := "Measurement Sheet Header"."PR No.";

                //SANKA RT 7655 on 2019-03-19

                //Sanka 2022/11/09
                IF "Measurement Sheet Header"."Foreign Currency Code" <> '' THEN
                    ForeignCurrencyText := '(' + "Measurement Sheet Header"."Foreign Currency Code" + ')'
                ELSE
                    ForeignCurrencyText := '(LKR)';
            end;

            trigger OnPreDataItem()
            begin
                //"Measurement Sheet Header".SETRANGE("Measurement Sheet Header"."Autho. No. Display", AuthoNo);
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                field("Special Subcon Bill"; SpecialSubConBill)
                {
                    Visible = false;
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        AuthoNo := "Measurement Sheet Header".GETFILTER("Measurement Sheet Header"."Autho. No. Display");
        EVALUATE(SubCodeIntInput, "Measurement Sheet Header".GETFILTER("Measurement Sheet Header"."SUb. CodeInt"));//RT #11730
        ForeignCurrencyText := '';

        IF AuthoNo = '' THEN BEGIN
            ERROR('Please Enter Authority Number !!');
        END;

        HOQs := '';
        PrepBy := '';
        GM := '';
        PM := '';
        //Get This Aditions
        ThisAdvance := 0;
        RetentionRelease := 0;
        DirLbrAmt := 0;
        MatDeduction := 0;
        FineDeductionAmt := 0;
        Retention := 0;
        OtherDeductionsAmt := 0;
        OutsAdvance := 0;
        SubCOnCode := ''; //For WHT
        VATAmt := 0;
        LoanPaid := 0; //New Feild
        LoanRecov := 0; //New Feild
        MobiAdvancePaid := 0;
        MobiAdvanceRecoverd := 0;
        MOSAdition := 0;
        MOSDed := 0;
        LCDed := 0;

        MeasurementSheetHeader.RESET;
        MeasurementSheetHeader.SETFILTER(MeasurementSheetHeader."Autho. No. Display", AuthoNo);
        MeasurementSheetHeader.SETRANGE(MeasurementSheetHeader."SUb. CodeInt", SubCodeIntInput); //RT #11730
        IF MeasurementSheetHeader.FINDFIRST THEN BEGIN

            //SANKA RT #8954 2019/07/10
            // IF NOT AuthorityReportCanView(MeasurementSheetHeader."No.") THEN
            //   ERROR('You cannot view Authority Report %1\ It was not Approved by QS Division G/M or CQS', AuthoNo);
            //SANKA RT #8954 2019/07/10

            ThisAdvance := MeasurementSheetHeader."Advance This";//MeasurementSheetHeader."Advance This"; comented SANKA
            RetentionRelease := MeasurementSheetHeader."Retention This";//SANKA 2018-12-31//MeasurementSheetHeader."Retention Released";
            DirLbrAmt := MeasurementSheetHeader."Direct Labour Amnt";
            MatDeduction := MeasurementSheetHeader."Mat. Deduction";
            FineDeductionAmt := MeasurementSheetHeader."Fine Deduction";
            Retention := MeasurementSheetHeader.Retention;
            OtherDeductionsAmt := MeasurementSheetHeader."Other Deduction";
            OutsAdvance := MeasurementSheetHeader."Advance Out.";
            SubCOnCode := MeasurementSheetHeader."Sub. Code"; //For WHT
            SubCodeInt := MeasurementSheetHeader."SUb. CodeInt";
            MobiAdvancePaid := MeasurementSheetHeader."Mob. Advance New";
            MobiAdvanceRecoverd := MeasurementSheetHeader."Mob. Advance Recovered";
            OutsRecoverd := MeasurementSheetHeader."Outstanding Recovered";
            MeshNum := MeasurementSheetHeader."No.";
            //MOS 02-28-2019 - - - - - - - - - - - - - - - - - - -
            MOSAdition := MeasurementSheetHeader."MOS Add. This";
            MOSDed := MeasurementSheetHeader."MOS Ded. This";
            LCDed := MeasurementSheetHeader."LC Ded. This";
            //MOS 02-28-2019 - - - - - - - - - - - - - - - - - - -

            //SANKA 2018-11-21 Hide Tax from Sub Project for (Tax Add to Bill = False)
            SubProject.RESET;
            SubProject.SETRANGE("Project Code", MeasurementSheetHeader."Shortcut Dimension 2 Code");
            SubProject.SETRANGE("No.", SubCodeInt); //Changed By Heaven 03-22-2019
            SubProject.SETRANGE("Vat Addto Bill", TRUE);
            IF SubProject.FINDFIRST THEN BEGIN
                IF MeasurementSheetHeader."TAX Jurisdiction Code" <> 'SVAT' THEN //SANKA 2020-09-16 RT #13271
                    VATAmt := MeasurementSheetHeader."TAX Amount";
                IF (MeasurementSheetHeader."TAX Jurisdiction Code" <> 'SVAT') THEN
                    SSCAmt := MeasurementSheetHeader."SSC TAX Amount";//Sanka 2023/08/11
                IF (MeasurementSheetHeader."TAX Jurisdiction Code" = 'SVAT') AND (VATAmt = 0) THEN
                    SSCAmt := MeasurementSheetHeader."SSC TAX Amount";//Sanka 2023/08/11


            END;
            //SANKA 2018-11-21 Hide Tax from Sub Project for (Tax Add to Bill = False)


            LoanPaid := MeasurementSheetHeader."Loan New";//MeasurementSheetHeader."Loan Paid"; // //New Feild
            LoanRecov := MeasurementSheetHeader."Loan Recovered"; //New Feild

            SubiName := MeasurementSheetHeader."Sub. Name";
            SubiCode := MeasurementSheetHeader."Sub. Code";
            Project := MeasurementSheetHeader."Project Name";
            Date := MeasurementSheetHeader."Date To";
            HOQs := MeasurementSheetHeader."HO QS Name";
            PrepBy := MeasurementSheetHeader."Created By";
            ProjCode := MeasurementSheetHeader."Shortcut Dimension 2 Code";
            GM := MeasurementSheetHeader."QS GM Name";
            PM := MeasurementSheetHeader."PM Name";
            //AccDept  :=
            AuthoNoInt := MeasurementSheetHeader."Autho No";

            RecVendor.RESET;
            RecVendor.SETRANGE(RecVendor."No.", SubCOnCode);
            IF RecVendor.FINDFIRST THEN BEGIN
                SubiAddr := RecVendor.Address + ', ' + RecVendor."Address 2" + ', ' + RecVendor.City;
                TaxLiable := RecVendor."Tax Liable";
                VendorTaxGroup := RecVendor."Tax Area Code";
                NIC := RecVendor.NIC;

            END;


        END;
        //Get This Aditions

        //Get Special Sub Details
        IsSpecialSubCOntractor := FALSE;
        SpeSubiDis := '';
        SpText := 'NIC';

        SubProject.RESET;
        SubProject.SETRANGE("Project Code", MeasurementSheetHeader."Shortcut Dimension 2 Code");
        //SubProject.SETRANGE("Sub Code", SubCOnCode);
        SubProject.SETRANGE("No.", MeasurementSheetHeader."SUb. CodeInt");
        IF SubProject.FINDFIRST THEN BEGIN
            IsSpecialSubCOntractor := SubProject."SP Subcon";
            SpeSubiDis := SubProject.Contract;
        END;

        IF IsSpecialSubCOntractor = TRUE THEN BEGIN
            SpText := 'CONTRACT';
        END;

        //Get Special Sub Details


        //Get CUM - - - - - -
        ThisAdvance_CUM := 0;
        RetentionRelease_CUM := 0;
        DirLbrAmt_CUM := 0;
        MatDeduction_CUM := 0;
        FineDeductionAmt_CUM := 0;
        Retention_CUM := 0;
        OtherDeductionsAmt_CUM := 0;
        OutsAdvance_CUM := 0;
        MobiAdvancePaid_CUM := 0;
        MobiAdvanceRecoverd_CUM := 0;
        OutsRecoverd_CUM := 0;

        MOSAdition_CUM := 0;
        MOSDed_CUM := 0;
        LCDed_CUM := 0;


        MeasurementSheetHeader.RESET;
        //MeasurementSheetHeader.SETFILTER(MeasurementSheetHeader."Sub. Code",SubCOnCode);
        MeasurementSheetHeader.SETFILTER(MeasurementSheetHeader."Shortcut Dimension 2 Code", ProjCode);
        MeasurementSheetHeader.SETRANGE(MeasurementSheetHeader."SUb. CodeInt", SubCodeInt);  //**
        MeasurementSheetHeader.SETRANGE("Autho No", 1, AuthoNoInt);
        MeasurementSheetHeader.SETRANGE("Cheque Voided", FALSE);  // Check Voided case Added on 03-15-2019


        IF MeasurementSheetHeader.FINDSET THEN
            REPEAT

                ThisAdvance_CUM += MeasurementSheetHeader."Advance Out."; //MeasurementSheetHeader."Advance New"
                RetentionRelease_CUM += MeasurementSheetHeader."Retention This"; //SANKA 2018-12-31 //MeasurementSheetHeader."Retention Released"
                DirLbrAmt_CUM += MeasurementSheetHeader."Direct Labour Amnt";
                MatDeduction_CUM += MeasurementSheetHeader."Mat. Deduction";
                FineDeductionAmt_CUM += MeasurementSheetHeader."Fine Deduction";
                Retention_CUM += MeasurementSheetHeader.Retention;
                OtherDeductionsAmt_CUM += MeasurementSheetHeader."Other Deduction";
                OutsAdvance_CUM += MeasurementSheetHeader."Advance Out.";
                WHT_CUm += MeasurementSheetHeader."WHT Amount";
                MobiAdvancePaid_CUM += MeasurementSheetHeader."Mob. Advance New";
                MobiAdvanceRecoverd_CUM += MeasurementSheetHeader."Mob. Advance Recovered";
                OutsRecoverd_CUM += MeasurementSheetHeader."Outstanding Recovered";
                //MOS 02-28-2019 - - - - - - - - - - - - - - - - - - -
                MOSAdition_CUM += MeasurementSheetHeader."MOS Add. This";
                MOSDed_CUM += MeasurementSheetHeader."MOS Ded. This";
                LCDed_CUM += MeasurementSheetHeader."LC Ded. This";
                //MOS 02-28-2019 - - - - - - - - - - - - - - - - - - -

                //SANKA 2018-11-21 Hide Tax from Sub Project for (Tax Add to Bill = False)
                SubProject.RESET;
                SubProject.SETRANGE("Project Code", MeasurementSheetHeader."Shortcut Dimension 2 Code");
                SubProject.SETRANGE(SubProject."No.", SubCodeInt);
                SubProject.SETRANGE("Vat Addto Bill", TRUE);
                IF SubProject.FINDFIRST THEN BEGIN
                    IF MeasurementSheetHeader."TAX Jurisdiction Code" <> 'SVAT' THEN //SANKA 2020-09-16 RT #13271
                        VATAmt_CUM += MeasurementSheetHeader."TAX Amount";
                    IF (MeasurementSheetHeader."TAX Jurisdiction Code" <> 'SVAT') AND (VATAmt_CUM <> 0) THEN
                        SSCAmt_CUM += MeasurementSheetHeader."SSC TAX Amount";//Sanka 2022/11/02
                    IF (MeasurementSheetHeader."TAX Jurisdiction Code" = 'SVAT') AND (VATAmt_CUM = 0) THEN
                        SSCAmt_CUM += MeasurementSheetHeader."SSC TAX Amount";//Sanka 2022/11/02

                END;
                LoanPaid_CUM += MeasurementSheetHeader."Loan New"; //New Feild
                LoanRecov_CUM += MeasurementSheetHeader."Loan Recovered"; //New Feild
            UNTIL MeasurementSheetHeader.NEXT = 0;

        //2018-11-09 SANKA
        //Get Advance paid from Advance
        AdvanceLineTbl.RESET;
        AdvanceLineTbl.SETRANGE("Project Code", ProjCode);
        AdvanceLineTbl.SETRANGE("Subcon CodeInt", SubCodeInt);
        AdvanceLineTbl.SETRANGE("Subcon Code", SubCOnCode);
        AdvanceLineTbl.SETRANGE("Autho. No.", 1, (MeasurementSheetHeader."Autho No" - 1));//("Measurement Sheet Header"."Autho No"-1));
        AdvanceLineTbl.SETRANGE(Authorise, AdvanceLineTbl.Authorise::"0");


        IF AdvanceLineTbl.FINDSET THEN
            REPEAT
                AdvanceLineSum += AdvanceLineTbl."This Adv.";

                IF AdvanceLineTbl."TAX Jurisdiction Code" <> 'SVAT' THEN //SANKA 2020-09-16 RT #13271
                    VATAmt_CUM += AdvanceLineTbl."Tax Amount";
            UNTIL AdvanceLineTbl.NEXT = 0;

        // ThisAdvance_CUM += AdvanceLineSum;
        ThisAdvance_CUM += MeasurementSheetHeader."Advance This";

        //Get CUM - - - - - -
        //Get Recoveries - - - -
        RecMat := 0;
        RecMat_CUM := 0;

        RecPPE := 0;
        RecPPE_CUM := 0;

        RecST := 0;
        RecST_CUM := 0;

        // - ------------------------------------------------------------------------------------
        "Sub Material Deduction".RESET;
        "Sub Material Deduction".SETRANGE("Subcontractor Code Int", SubCodeInt);
        "Sub Material Deduction".SETRANGE(Cancel, FALSE);
        "Sub Material Deduction".SETRANGE("Measure. No.", MeshNum);
        "Sub Material Deduction".SETRANGE(MSC, FALSE);
        "Sub Material Deduction".SETRANGE(Type, 0);
        IF "Sub Material Deduction".FINDSET THEN
            REPEAT
                RecMat += "Sub Material Deduction".Amount;
            UNTIL "Sub Material Deduction".NEXT = 0;
        "Sub Material Deduction".RESET;
        "Sub Material Deduction".SETRANGE("Subcontractor Code Int", SubCodeInt);
        "Sub Material Deduction".SETRANGE("Autho No", 1, (MeasurementSheetHeader."Autho No"));//14-08-2020 Heaven
        "Sub Material Deduction".SETRANGE(Cancel, FALSE);
        "Sub Material Deduction".SETRANGE(MSC, FALSE);
        "Sub Material Deduction".SETRANGE(Type, 0);
        IF "Sub Material Deduction".FINDSET THEN
            REPEAT
                RecMat_CUM += "Sub Material Deduction".Amount;
            UNTIL "Sub Material Deduction".NEXT = 0;

        // - ------------------------------------------------------------------------------------
        // /////////////////////////////////////////////////////////////////////////////////////////
        "Sub Material Deduction".RESET;
        "Sub Material Deduction".SETRANGE("Subcontractor Code Int", SubCodeInt);
        "Sub Material Deduction".SETRANGE(Cancel, FALSE);
        "Sub Material Deduction".SETRANGE("Measure. No.", MeshNum);
        "Sub Material Deduction".SETRANGE(Type, 1);

        IF "Sub Material Deduction".FINDSET THEN
            REPEAT
                RecPPE += "Sub Material Deduction".Amount;
            UNTIL "Sub Material Deduction".NEXT = 0;

        "Sub Material Deduction".RESET;
        "Sub Material Deduction".SETRANGE("Subcontractor Code Int", SubCodeInt);
        "Sub Material Deduction".SETRANGE("Autho No", 1, (MeasurementSheetHeader."Autho No"));//14-08-2020 Heaven
        "Sub Material Deduction".SETRANGE(Cancel, FALSE);
        "Sub Material Deduction".SETRANGE(Type, 1);

        IF "Sub Material Deduction".FINDSET THEN
            REPEAT
                RecPPE_CUM += "Sub Material Deduction".Amount;
            UNTIL "Sub Material Deduction".NEXT = 0;
        // /////////////////////////////////////////////////////////////////////////////////////////

        // *****************************************************************************************
        "Sub Material Deduction".RESET;
        "Sub Material Deduction".SETRANGE("Measure. No.", MeshNum);
        "Sub Material Deduction".SETRANGE(Cancel, FALSE);
        "Sub Material Deduction".SETRANGE("Subcontractor Code Int", SubCodeInt);
        "Sub Material Deduction".SETRANGE(Type, 2);

        IF "Sub Material Deduction".FINDSET THEN
            REPEAT
                RecST += "Sub Material Deduction".Amount;
            UNTIL "Sub Material Deduction".NEXT = 0;

        "Sub Material Deduction".RESET;
        "Sub Material Deduction".SETRANGE("Subcontractor Code Int", SubCodeInt);
        "Sub Material Deduction".SETRANGE(Cancel, FALSE);
        "Sub Material Deduction".SETRANGE(Type, 2);

        IF "Sub Material Deduction".FINDSET THEN
            REPEAT
                RecST_CUM += "Sub Material Deduction".Amount;
            UNTIL "Sub Material Deduction".NEXT = 0;
        // *****************************************************************************************


        // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        SubMatDed_msc := 0.0;
        SubMatDed_CUM_msc := 0.0;

        "Sub Material Deduction".RESET;
        "Sub Material Deduction".SETRANGE("Subcontractor Code Int", SubCodeInt);
        "Sub Material Deduction".SETRANGE(Cancel, FALSE);
        "Sub Material Deduction".SETRANGE("Measure. No.", MeshNum);
        "Sub Material Deduction".SETRANGE(Type, 0);
        "Sub Material Deduction".SETRANGE(MSC, TRUE);


        IF "Sub Material Deduction".FINDSET THEN
            REPEAT
                SubMatDed_msc += "Sub Material Deduction".Amount;
            UNTIL "Sub Material Deduction".NEXT = 0;

        "Sub Material Deduction".RESET;
        "Sub Material Deduction".SETRANGE("Subcontractor Code Int", SubCodeInt);
        "Sub Material Deduction".SETRANGE("Autho No", 1, (MeasurementSheetHeader."Autho No")); //14-08-2020 Heaven
        "Sub Material Deduction".SETRANGE(Cancel, FALSE);
        "Sub Material Deduction".SETRANGE(Type, 0);
        "Sub Material Deduction".SETRANGE(MSC, TRUE);

        IF "Sub Material Deduction".FINDSET THEN
            REPEAT
                SubMatDed_CUM_msc += "Sub Material Deduction".Amount;
            UNTIL "Sub Material Deduction".NEXT = 0;
        // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        //Get Recoveries - - -
    end;

    var
        "SP Subcontractor Bill Lines": Record "50221";
        MeshNum: Code[100];
        PrCrNo: Code[80];
        MeasurementSheetLine: Record "50049";
        SubcontractorLabourSupply: Record "50187";
        SubBillTempItemsLine: Record "50042";
        SubSPWorkers: Record "50203";
        ItemAmount: Decimal;
        ItemName: Text[250];
        SubItemMasterRate: Record "50011";
        I: Integer;
        AuthoNo: Code[50];
        Rec_SubAdvanceLine: Record "50152";
        Rec_SubAdvanceHeader: Record "50067";
        Project: Text[100];
        Date: Date;
        SubiCode: Code[50];
        SubiName: Text[100];
        AdvNum: Code[50];
        RecVendor: Record "23";
        SubiAddr: Text[150];
        PrepBy: Code[50];
        HOQs: Code[50];
        ProjCode: Code[50];
        AuthoNoInt: Integer;
        TaxLiable: Boolean;
        Contract_txt: Text[250];
        MeasurementSheetHeader: Record "50048";
        ThisAdvance: Decimal;
        ThisAdvance_CUM: Decimal;
        RetentionRelease: Decimal;
        RetentionRelease_CUM: Decimal;
        DirLbrAmt: Decimal;
        DirLbrAmt_CUM: Decimal;
        MatDeduction: Decimal;
        MatDeduction_CUM: Decimal;
        FineDeductionAmt: Decimal;
        FineDeductionAmt_CUM: Decimal;
        Retention: Decimal;
        Retention_CUM: Decimal;
        OtherDeductionsAmt: Decimal;
        OtherDeductionsAmt_CUM: Decimal;
        OutsAdvance: Decimal;
        OutsAdvance_CUM: Decimal;
        WHT_CUm: Decimal;
        WhtPercentage: Decimal;
        Rec_GeneralLedgerSetup: Record "98";
        SubCOnCode: Code[50];
        WHTAmt: Decimal;
        SSCAmt: Decimal;
        SSCAmt_CUM: Decimal;
        ItemAmount_Cum: Decimal;
        ItemAmount_CumFunc: Decimal;
        MesureSheeAuthotNo: Integer;
        TaxCalculateCU: Codeunit "398";
        TaxAmount: Decimal;
        VATAmt: Decimal;
        VATAmt_CUM: Decimal;
        VendorTaxGroup: Code[80];
        LoanPaid: Decimal;
        LoanRecov: Decimal;
        LoanPaid_CUM: Decimal;
        LoanRecov_CUM: Decimal;
        temp: Code[80];
        AdvanceLineTbl: Record "50152";
        GM: Code[50];
        PM: Code[50];
        AccDept: Code[50];
        AdvanceLineSum: Decimal;
        NIC: Text[50];
        SubProject: Record "50050";
        SubCodeInt: Integer;
        MobiAdvancePaid: Decimal;
        MobiAdvancePaid_CUM: Decimal;
        MobiAdvanceRecoverd: Decimal;
        MobiAdvanceRecoverd_CUM: Decimal;
        IsSpecialSubCOntractor: Boolean;
        SpeSubiDis: Text[250];
        SpText: Text[250];
        MOSAdition: Decimal;
        MOSAdition_CUM: Decimal;
        MOSDed: Decimal;
        MOSDed_CUM: Decimal;
        LCDed: Decimal;
        LCDed_CUM: Decimal;
        OutsRecoverd: Decimal;
        OutsRecoverd_CUM: Decimal;
        IsCheckVoided: Boolean;
        HiddenVar: Text[20];
        SubCodeIntInput: Integer;
        SubMatDed_msc: Decimal;
        SubMatDed_CUM_msc: Decimal;
        "Sub Material Deduction": Record "50219";
        RecMat: Decimal;
        RecMat_CUM: Decimal;
        RecPPE: Decimal;
        RecPPE_CUM: Decimal;
        RecST: Decimal;
        RecST_CUM: Decimal;
        "-----------Sp Subcon Bills------------------------": Integer;
        SpecialSubConBill: Boolean;
        ForeignCurrencyText: Text;

    [Scope('Internal')]
    procedure GetCumAmt(var gbl2Code: Code[50]; var SubCode: Code[50]; var ItemCode: Code[50]; var AuthorNo: Integer; var SubCodeInt: Integer): Decimal
    begin

        ItemAmount_CumFunc := 0;

        MeasurementSheetLine.RESET;
        //MeasurementSheetLine.CALCFIELDS(MeasurementSheetLine."Cheque Voided");
        MeasurementSheetLine.SETRANGE(MeasurementSheetLine."Subcon. CodeInt", SubCodeInt);
        MeasurementSheetLine.SETRANGE(MeasurementSheetLine."Project Code", gbl2Code);
        MeasurementSheetLine.SETRANGE(MeasurementSheetLine."Cheque Voided", FALSE);  //Check Voided case Added on 03-15-2019
        MeasurementSheetLine.SETRANGE(MeasurementSheetLine."Item Code", ItemCode);
        MeasurementSheetLine.SETRANGE("Autho Number", 1, AuthorNo);

        IF MeasurementSheetLine.FINDSET THEN
            REPEAT
                ItemAmount_CumFunc += MeasurementSheetLine."This Amount";
            UNTIL MeasurementSheetLine.NEXT = 0;


        SubBillTempItemsLine.RESET;
        SubBillTempItemsLine.SETRANGE(SubBillTempItemsLine."Project Code", gbl2Code);
        SubBillTempItemsLine.SETRANGE(SubBillTempItemsLine."Item Code", ItemCode);
        SubBillTempItemsLine.SETRANGE("Autho.  Number", 1, AuthorNo);
        SubBillTempItemsLine.SETRANGE(SubBillTempItemsLine."Subcon. CodeInt", SubCodeInt);
        SubBillTempItemsLine.SETRANGE("Cheque Voided", FALSE); // Check Voided case Added on 03-15-2019
        IF SubBillTempItemsLine.FINDSET THEN
            REPEAT
                SubBillTempItemsLine.CALCFIELDS(SubBillTempItemsLine."Item Amount");
                ItemAmount_CumFunc += SubBillTempItemsLine."Item Amount";
            UNTIL SubBillTempItemsLine.NEXT = 0;

        SubcontractorLabourSupply.RESET;
        SubcontractorLabourSupply.SETRANGE(SubcontractorLabourSupply."Project Code", gbl2Code);
        //SubcontractorLabourSupply.SETRANGE(SubcontractorLabourSupply."Subcon. Code",SubCode); Coommented by heaven 03-22-2019
        SubcontractorLabourSupply.SETRANGE(SubcontractorLabourSupply."Item Code", ItemCode);
        SubcontractorLabourSupply.SETRANGE(SubcontractorLabourSupply."Autho. Number", 1, AuthorNo);
        SubcontractorLabourSupply.SETRANGE(SubcontractorLabourSupply."Subcon. CodeInt", SubCodeInt);
        SubcontractorLabourSupply.SETRANGE("Cheque Voided", FALSE); // Check Voided case Added on 03-15-2019
        IF SubcontractorLabourSupply.FINDSET THEN
            REPEAT
                ItemAmount_CumFunc += SubcontractorLabourSupply.Amount;
            UNTIL SubcontractorLabourSupply.NEXT = 0;


        //Sanka 2018-12-26 get SP Workers line T-50203
        SubSPWorkers.RESET;
        SubSPWorkers.SETRANGE(SubSPWorkers."Project Code", gbl2Code);
        SubSPWorkers.SETRANGE("Subcon. CodeInt", SubCodeInt);
        SubSPWorkers.SETRANGE("Item Code", ItemCode);
        SubSPWorkers.SETRANGE("Autho. Number", 1, AuthorNo);
        SubSPWorkers.SETRANGE("Cheque Voided", FALSE); // Check Voided case Added on 03-15-2019

        IF SubSPWorkers.FINDSET THEN
            REPEAT

                ItemAmount_CumFunc += SubSPWorkers.Amount;
            UNTIL SubSPWorkers.NEXT = 0;


        //Get from SP Subcontractor Bill Lines 28-05-2020 by heaven
        "SP Subcontractor Bill Lines".RESET;
        "SP Subcontractor Bill Lines".SETRANGE("Project Code", gbl2Code);
        "SP Subcontractor Bill Lines".SETRANGE("Subcontractor Id", SubCodeInt);
        "SP Subcontractor Bill Lines".CALCFIELDS("Item Code");
        "SP Subcontractor Bill Lines".SETRANGE("Item Code", "Sub Item Project Rate"."Item Code");
        "SP Subcontractor Bill Lines".SETRANGE("Autho Id", 1, AuthorNo);
        "SP Subcontractor Bill Lines".SETRANGE(Cancel, FALSE); // cacelled bill added on 2020-06-23   Sanka

        IF "SP Subcontractor Bill Lines".FINDSET THEN
            REPEAT
                ItemAmount_CumFunc += "SP Subcontractor Bill Lines"."This Bill Amount";
            UNTIL "SP Subcontractor Bill Lines".NEXT = 0;
        //Get from SP Subcontractor Bill Lines 28-05-2020 by heaven



        EXIT(ItemAmount_CumFunc);
    end;

    [Scope('Internal')]
    procedure AuthorityReportCanView(var BillNo: Code[50]): Boolean
    var
        MeasurementSheet: Record "50048";
        UserSetup: Record "91";
    begin
        //SANKA RT #8954 2019/07/10

        IF UserSetup.GET(USERID) THEN BEGIN
            IF (UserSetup."3rd Approver (CQS) - Subcontr." = FALSE) AND (UserSetup."4th Approver (GM) - Subcontr." = FALSE) AND ((UserSetup."QS Officer Project" <> '') OR (UserSetup."QS Officer Project 2" <> '') OR (UserSetup."QS Officer Project 3" <> '')) THEN BEGIN
                MeasurementSheet.RESET;
                MeasurementSheet.SETRANGE("No.", BillNo);
                MeasurementSheet.SETRANGE("QS GM Approval", TRUE);
                IF MeasurementSheet.FIND('-') THEN
                    EXIT(TRUE) ELSE
                    EXIT(FALSE);
            END ELSE
                EXIT(TRUE);
        END;
    end;
}

