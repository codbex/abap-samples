import { initializeABAP } from '../dist/abap/init.mjs';
import { zcl_abap_app } from '../dist/abap/zcl_abap_app.clas.mjs';


await initializeABAP();

const params = {
    iv_string: "John Doe"
}
await zcl_abap_app.run(params);
