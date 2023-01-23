import { ApplicationError } from "../protocols/error.PROTOCOLS.js";

export function NotfoundError(message: string): ApplicationError {
  return {
    name: "NotFoundError",
    message,
  };
}