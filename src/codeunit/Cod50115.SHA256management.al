codeunit 50115 "SHA256 management"
{
    trigger OnRun();
    begin
    end;

    procedure GetSignature(RequestText: Text): Text;
    var
        SHA256Setup: Record "SHA256 Setup";
        URI: Text;
    begin
        SHA256Setup.get();
        SHA256Setup.TestField("Signature API");
        SHA256Setup.TestField("HMAC Key");

        URI := SHA256Setup."Signature API" + '?text=' + RequestText + '&key=' + SHA256Setup."HMAC Key";
        Exit(SendRequest(URI));
    end;

    local procedure SendRequest(URI: Text) ResponseText: Text;
    var
        Client: HttpClient;
        ResponseMessage: HttpResponseMessage;
    begin
        if not Client.Get(URI, ResponseMessage) then
            Error(Error001_Err, 'GET');
        if not ResponseMessage.IsSuccessStatusCode() then begin
            ResponseMessage.Content().ReadAs(ResponseText);
            error(Error002_Err, ResponseMessage.HttpStatusCode(), ResponseText);
        end;

        ResponseMessage.Content().ReadAs(ResponseText);
        exit(ResponseText);
    end;

    var
        Error001_Err: Label 'The %1 call to the web service failed.';
        Error002_Err: Label 'The web service returned an error message:\ Status code: %1\ Description: %2';
}