import { ApplicationError } from "../protocols/error.PROTOCOLS.js";

export function DuplicityError(message: string): ApplicationError {
  return {
    name: "DuplicityError",
    message,
  };
}