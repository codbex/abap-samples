import { request, response } from "sdk/http";
import { FunctionParamsDTO, FunctionResultDTO } from "./function-data-dto"
import { execute } from "/string-util/dist/run.mjs"

const dto: FunctionParamsDTO = request.getJSON();

const resultRows: [number, any][] = [];

for (let rowData of dto.data) {
    const rowIndex: number = rowData[0];

    const params: any[] = rowData.slice(1);

    const abapParams = {
        iv_string1: params[0],
        iv_string2: params[1]
    };
    const abapResult = await execute(abapParams);

    const resultRow: [number, any] = [rowIndex, abapResult];

    resultRows.push(resultRow);
}

const result: FunctionResultDTO = {
    data: resultRows
};


response.setContentType("application/json");
response.println(JSON.stringify(result));
response.flush();
response.close();