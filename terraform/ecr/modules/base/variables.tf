variable "name" {
  type        = string
  description = "ecr repository 이름"
}

variable "num_to_remain" {
  type        = number
  description = "ecr에서 저장되는 최대 이미지 수"
}
