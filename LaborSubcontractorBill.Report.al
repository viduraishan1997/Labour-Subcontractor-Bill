report 50100 "Labor Subcontractor Report"
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
            //...................Additions......................................//
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
            //...................Additions......................................//

            //...................Deductions......................................//
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
            //...................Deductions......................................//
            //...Chnages Done.....
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
            LayoutFile = 'LaborSubcontractorBill.rdlc';
        }
    }
    trigger OnPreReport()
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
    end;

    var
        myInt: Integer;
        Date: Date;
        CompanyInfo: Record "Company Information";
        ReportTitel: Label 'Labor Subcontractor Bill';

}