import httpStatus from "http-status";
export default function validateBody(schema) {
    return validate(schema);
}
function validate(schema) {
    return function (req, res, next) {
        var error = schema.validate({ abortEarly: false }).error;
        if (error) {
            res.sendStatus(httpStatus.BAD_REQUEST).send({ message: error.details.map(function (o) { return o.message; }) });
        }
        next();
    };
}
