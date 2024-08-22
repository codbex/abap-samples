import { request, response } from "sdk/http";
import { ConcatenateParamsDTO, ConcatenateResultDTO } from "./concatenate-dto"
import { execute } from "/abap-string-util/dist/run.mjs"

const params: ConcatenateParamsDTO = request.getJSON();

const abapParams = {
    iv_string1: params.param1,
    iv_string2: params.param2
};
const abapResult = await execute(abapParams);

const result: ConcatenateResultDTO = {
    result: abapResult
};

response.setContentType("application/json");
response.println(JSON.stringify(result));
response.flush();
response.close();
