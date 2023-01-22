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
import { DuplicityError } from "@/errors/DuplicityError";
import { NotfoundError } from "@/errors/NotFoundError";
import { UnauthorizedError } from "@/errors/UnauthorizedError";
import userRepository from "@/repository/user.REPOSITORY";
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import dotenv from 'dotenv';
dotenv.config();
function validateUserSignIn(user) {
    return __awaiter(this, void 0, void 0, function () {
        var email, passCheck;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0: return [4 /*yield*/, userRepository.checkEmailExistence(user.email)];
                case 1:
                    email = _a.sent();
                    if (email.length === 0) {
                        throw NotfoundError("Email not registered");
                    }
                    return [4 /*yield*/, userRepository.checkPassword(user)];
                case 2:
                    passCheck = _a.sent();
                    if (!passCheck) {
                        throw UnauthorizedError("Email or password incorrect");
                    }
                    return [2 /*return*/];
            }
        });
    });
}
function getCredentials(email) {
    return __awaiter(this, void 0, void 0, function () {
        var token;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    token = jwt.sign(email, process.env.JWT_SECRET);
                    return [4 /*yield*/, userRepository.createSession(token, email)];
                case 1:
                    _a.sent();
                    return [2 /*return*/, token];
            }
        });
    });
}
function createUser(user) {
    return __awaiter(this, void 0, void 0, function () {
        var doubleEmail, doubleUsername, encryptedPass;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0: return [4 /*yield*/, userRepository.checkEmailExistence(user.email)];
                case 1:
                    doubleEmail = _a.sent();
                    if (doubleEmail.length > 0) {
                        throw DuplicityError("Email already in use");
                    }
                    return [4 /*yield*/, userRepository.validateUsernameDuplicity(user.email)];
                case 2:
                    doubleUsername = _a.sent();
                    if (doubleUsername.length > 0) {
                        throw DuplicityError("Username already in use");
                    }
                    encryptedPass = bcrypt.hashSync(user.password, 12);
                    user.password = encryptedPass;
                    return [4 /*yield*/, userRepository.insertUser(user)];
                case 3:
                    _a.sent();
                    return [2 /*return*/];
            }
        });
    });
}
var userServices = {
    validateUserSignIn: validateUserSignIn,
    getCredentials: getCredentials,
    createUser: createUser
};
export default userServices;
