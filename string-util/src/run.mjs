import { initializeABAP } from '../dist/abap/init.mjs';
import { zcl_abap_app } from '../dist/abap/zcl_abap_app.clas.mjs';


await initializeABAP();

await zcl_abap_app.run("Ivan");
