import DBConnection from "@/database/db";


async function InvestmentsTypes() {
    await DBConnection.movimentation_types.createMany({
        data:[
            
        ]
    })
    
}

InvestmentsTypes()
    .then(() => console.log("Done"))