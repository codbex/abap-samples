import { DatabaseInitializer } from "sdk/abap/database";
import { initializeABAP } from '../dist/abap/init.mjs';

import { zcl_abap_app } from '../dist/abap/zcl_abap_app.clas.mjs';

async function initialize() {
    DatabaseInitializer.initDefaultDataSource();
    await initializeABAP();
}

export async function execute(parameters) {
    await initialize();

    const defaultParams = {
        iv_string1: "Hello ",
        iv_string2: "John Doe"
    };
    const params = parameters ? parameters : defaultParams;

    const result = await zcl_abap_app.run(params);
    console.log("Received result: " + JSON.stringify(result));
    return result.value;
}
