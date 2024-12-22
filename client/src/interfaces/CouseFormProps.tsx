export interface CourseFormProps {
  onSubmit: (name: string, description: string) => Promise<void>;
}