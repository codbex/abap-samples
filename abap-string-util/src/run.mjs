import { DatabaseInitializer } from "sdk/abap/database";
import { initializeABAP } from '../dist/abap/init.mjs';

import { zcl_abap_app } from '../dist/abap/zcl_abap_app.clas.mjs';

async function initialize() {
    DatabaseInitializer.initDefaultDataSource('PB');
    await initializeABAP();
    // manually register the table
    abap.DDIC.CP_Z1SFLIGHT2 = {
        "objectType": "TABL",
        "type": {
            "value": {
                "offset": {
                    "value": 0,
                    "qualifiedName": "I"
                },
                "length": {
                    "value": 0,
                    "qualifiedName": "I"
                }
            },
            "qualifiedName": "cp_z1sflight2",
            "ddicName": "cp_z1sflight2",
            "suffix": {},
            "asInclude": {}
        },
        "keyFields": ["id"]
    };


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
