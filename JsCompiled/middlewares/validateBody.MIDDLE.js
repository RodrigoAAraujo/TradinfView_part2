export default function validateBody(schema) {
    return validate(schema);
}
function validate(schema) {
    return function (req, res, next) {
        var error = schema.validate(req.body, { abortEarly: false }).error;
        if (error) {
            res.status(400).send({ message: error.details.map(function (o) { return o.message; }) });
            return;
        }
        else {
            next();
        }
    };
}
