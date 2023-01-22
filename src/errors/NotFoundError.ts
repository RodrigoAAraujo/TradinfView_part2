import { ApplicationError } from "@/protocols";

export function NotfoundError(message: string): ApplicationError {
  return {
    name: "NotFoundError",
    message,
  };
}