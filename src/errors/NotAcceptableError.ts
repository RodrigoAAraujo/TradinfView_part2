import { ApplicationError } from "../protocols/error.PROTOCOLS.js";

export function NotAcceptableError(message: string): ApplicationError {
  return {
    name: "NotAcceptableError",
    message,
  };
}