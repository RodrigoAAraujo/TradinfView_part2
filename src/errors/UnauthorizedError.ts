import { ApplicationError } from "../protocols/error.PROTOCOLS.js";

export function UnauthorizedError(message: string): ApplicationError {
  return {
    name: "UnauthorizedError",
    message,
  };
}