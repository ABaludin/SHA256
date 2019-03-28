table 50115 "SHA256 Setup"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Entry No.';
        }

        field(4; "HMAC Key"; text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'HMAC Key';
        }
        field(5; "Signature API"; text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Signature API';
        }

    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}