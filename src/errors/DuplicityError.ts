import { ApplicationError } from "@/protocols";

export function DuplicityError(message: string): ApplicationError {
  return {
    name: "DuplicityError",
    message,
  };
}