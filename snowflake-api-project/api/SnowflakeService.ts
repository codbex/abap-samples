import { Controller, Post } from "sdk/http"
import { FunctionParamsDTO, FunctionResultDTO } from "./function-data-dto"
import { ConcatenateParamsDTO, ConcatenateResultDTO } from "./concatenate-dto"
import { execute } from "/string-util/dist/run.mjs"

@Controller
class SnowflakeService {

    @Post("/udf")
    public processUDF(dto: FunctionParamsDTO): FunctionResultDTO {
        const resultRows: [number, any][] = [];

        dto.data.forEach((rowData) => {
            const rowIndex: number = rowData[0];

            const params: any[] = rowData.slice(1);
            const functionReturnValue = params.join("|");

            const resultRow: [number, any] = [rowIndex, functionReturnValue];

            resultRows.push(resultRow);
        });
        return {
            data: resultRows
        };
    }

    @Post("/concatenate")
    public async concatenate(params: ConcatenateParamsDTO): Promise<ConcatenateResultDTO> {
        const abapParams = {
            iv_string1: params.param1,
            iv_string2: params.param2
        };
        const result = await execute(abapParams);
        console.log("Result in REST: " + result);
        return {
            result: result
        };
    }

}
