report 50100 "Labour Subcontractor Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;

    dataset
    {
        dataitem(DataItem00001; "Labor SC Bill Header")
        {
            RequestFilterFields = "Authority Number", "No.", "Job No.";
            column(CompanyName; COMPANYPROPERTY.DisplayName())
            {
            }
            column(ProJect; JobSubContractorDescription)
            {
            }
            column(Contract; ContractDescription)
            {
            }
            column(SubcontractorNo; SubcontractorNo)
            {
            }
            column(CompanyPic; CompanyInfo.Picture)
            {
            }
            column(CompanyAddress; CompanyInfo.Address)
            {
            }
            column(ReportTitel; ReportTitel)
            {
            }
            column(No_; "No.")
            {
            }
            column(Subcontractor_Card_No_; "Subcontractor Card No.")
            {
            }
            column(Agreement_Code; "Agreement Code")
            {
            }
            column(Authority_Number; "Authority Number")
            {
            }
            column(Subcontractor_No_; "Subcontractor No.")
            {
            }
            column(Subcontractor_Name; "Subcontractor Name")
            {
            }
            column(Vendor_No_; "Vendor No.")
            {
            }
            column(Vendor_Invoice_No_; "Vendor Invoice No.")
            {
            }
            column(Description; Description)
            {
            }
            column(Job_No_; "Job No.")
            {
            }
            column(Avg__Labour_Head_Count; "Avg. Labour Head Count")
            {
            }
            column(From_Date; "From Date")
            {
            }
            column(To_Date; "To Date")
            {
            }
            column(Created_Date; "Created Date")
            {
            }
            column(Posting_Date; "Posting Date")
            {
            }
            column(Purchase_Invoice_No_; "Purchase Invoice No.")
            {
            }
            column(Posted_Purchase_Invoice_No_; "Posted Purchase Invoice No.")
            {
            }
            column(Prev__Billed_Cum__Advance_Amt_; "Prev. Billed Cum. Advance Amt.")
            {
            }
            column(Advance_Amount; "Advance Amount")
            {
            }
            column(Other_Additions; "Other Additions")
            {
            }
            column(Reason_for_Other_Additions; "Reason for Other Additions")
            {
            }
            column(Billed_Cum__Adv__Deduct_Amt_; "Billed Cum. Adv. Deduct Amt.")
            {
            }
            column(Prev__Billed_Oust__Adv__Amt_; "Prev. Billed Oust. Adv. Amt.")
            {
            }
            column(Advance_Deduct_Amount; "Advance Deduct Amount")
            {
            }
            column(Retention__; "Retention %")
            {
            }
            column(Fines; Fines)
            {
            }
            column(Other_Deductions; "Other Deductions")
            {
            }
            column(Total_Bill_Consumption_Amount; "Total Bill Consumption Amount")
            {
            }
            column(BillMaterDeduDescription; BillMaterDeduDescription)
            {

            }
            column(BillMaterDeduAmount; BillMaterDeduAmount)
            {

            }
            dataitem("Labor SC Bill Line"; "Labor SC Bill Line")
            {
                DataItemLink = "Bill No." = field("No.");
                column(Description_LaborSCBillLine; Description)
                {

                }
                column(Cumulative_Amount_LaborSCBillLine; "Cumulative Amount")
                {

                }
                column(Amount_for_this_Bill; "Amount for this Bill")
                {

                }
            }
            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                if LabourSubcontractorHeader.FindFirst() then begin
                    JobSubcontractor.Reset();
                    JobSubcontractor.SetRange("No.", LabourSubcontractorHeader."Subcontractor Card No.");
                    if JobSubcontractor.FindSet() then begin
                        JobSubContractorDescription := JobSubcontractor."Job Description";
                        ContractDescription := JobSubcontractor.Description;
                        SubcontractorNo := JobSubcontractor."Subcontractor No.";
                    end;
                    BillMaterialDeduction.Reset();
                    BillMaterialDeduction.SetRange("Bill No.", LabourSubcontractorHeader."No.");
                    if BillMaterialDeduction.FindSet() then begin
                        BillMaterDeduDescription := BillMaterialDeduction.Description;
                        BillMaterDeduAmount := BillMaterialDeduction.Amount;
                    end;
                end;
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = 'LaborSubcontractorBill1.rdlc';
        }
    }
    trigger OnPreReport()
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
    end;

    var
        Date: Date;
        CompanyInfo: Record "Company Information";
        ReportTitel: Label 'Labor Subcontractor Bill';
        LabourSubcontractorHeader: Record "Labor SC Bill Header";
        LabourSubcontractorLine: Record "Labor SC Bill Line";
        JobSubcontractor: Record "Job Subcontractor";
        BillMaterialDeduction: Record "Bill Material Deduction";
        JobSubContractorDescription: Text[100];
        ContractDescription: Text[100];
        SubcontractorNo: Code[20];
        BillMaterDeduDescription: Text[100];
        BillMaterDeduAmount: Decimal;
}