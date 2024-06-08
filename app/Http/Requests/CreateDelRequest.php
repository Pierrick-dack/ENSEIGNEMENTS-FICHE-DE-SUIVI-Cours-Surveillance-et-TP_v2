<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CreateDelRequest extends FormRequest {
    public function authorize(): bool {
        return true;
    }

    public function rules(): array {
        return [
            'nameDel' => 'required',
            'emailDel' => 'required',
            'matDel' => 'required',
            'mdpDel' => 'required|min:6|max:15',
        ];
    }

}
