var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (g && (g = 0, op[0] && (_ = 0)), _) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
import DBconnection from "../database/db.js";
import bcrypt from 'bcrypt';
function insertUser(user) {
    return __awaiter(this, void 0, void 0, function () {
        return __generator(this, function (_a) {
            try {
                if (user.image_url === null) {
                    DBconnection.query("INSERT INTO users (username, email, password, image_url) VALUES ($1, $2, $3)", [user.username, user.email, user.password]);
                }
                DBconnection.query("INSERT INTO users (username, email, password, image_url) VALUES ($1, $2, $3, $4)", [user.username, user.email, user.password, user.image_url]);
            }
            catch (err) {
                throw err;
            }
            return [2 /*return*/];
        });
    });
}
function checkPassword(user) {
    return __awaiter(this, void 0, void 0, function () {
        var password, passCheck, err_1;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    _a.trys.push([0, 2, , 3]);
                    return [4 /*yield*/, DBconnection.query("SELECT password FROM users WHERE email=$1", [user.email])];
                case 1:
                    password = (_a.sent()).rows[0].password;
                    passCheck = bcrypt.compareSync(user.password, password);
                    return [2 /*return*/, passCheck];
                case 2:
                    err_1 = _a.sent();
                    throw err_1;
                case 3: return [2 /*return*/];
            }
        });
    });
}
function checkEmailExistence(email) {
    return __awaiter(this, void 0, void 0, function () {
        var doubleEmail, err_2;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    _a.trys.push([0, 2, , 3]);
                    return [4 /*yield*/, DBconnection.query("SELECT email FROM users WHERE email = $1", [email])];
                case 1:
                    doubleEmail = _a.sent();
                    return [2 /*return*/, doubleEmail.rows];
                case 2:
                    err_2 = _a.sent();
                    throw err_2;
                case 3: return [2 /*return*/];
            }
        });
    });
}
function validateUsernameDuplicity(username) {
    return __awaiter(this, void 0, void 0, function () {
        var doubleUsername, err_3;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    _a.trys.push([0, 2, , 3]);
                    return [4 /*yield*/, DBconnection.query("SELECT email FROM users WHERE username = $1", [username])];
                case 1:
                    doubleUsername = _a.sent();
                    return [2 /*return*/, doubleUsername.rows];
                case 2:
                    err_3 = _a.sent();
                    throw err_3;
                case 3: return [2 /*return*/];
            }
        });
    });
}
var userRepository = {
    insertUser: insertUser,
    checkEmailExistence: checkEmailExistence,
    checkPassword: checkPassword,
    validateUsernameDuplicity: validateUsernameDuplicity
};
export default userRepository;
