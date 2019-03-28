page 50115 "SHA256 Setup"
{
    PageType = Card;
    SourceTable = "SHA256 Setup";
    Caption = 'Demo 1 Hash Setup';
    ApplicationArea = All;
    UsageCategory = Administration;
    LinksAllowed = false;
    DataCaptionExpression = '';

    layout
    {
        area(content)
        {
            group(GroupName)
            {
                field("HMAC Key"; "HMAC Key")
                {
                    ApplicationArea = All;
                }
                field("Signature API"; "Signature API")
                {
                    ApplicationArea = All;
                }

                field(RequestText; RequestText)
                {
                    ApplicationArea = All;
                }

                field(HashText; HashText)
                {
                    ApplicationArea = All;
                    Editable = false;
                    MultiLine = true;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(SendText)
            {
                ApplicationArea = All;
                Caption = 'Send data to Azure function';
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Image = Web;

                trigger OnAction();
                var
                    FuncMgt: Codeunit "SHA256 management";
                begin
                    HashText := FuncMgt.GetSignature(RequestText);
                end;

            }
        }
    }
    var
        RequestText: Text;
        HashText: Text;
}