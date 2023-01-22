import { ApplicationError } from "@/protocols";

export function UnauthorizedError(message: string): ApplicationError {
  return {
    name: "UnauthorizedError",
    message,
  };
}