<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class LogEnsRequest extends FormRequest {

    public function authorize(): bool {
        return true;
    }

    public function rules(): array {
        return [
            'nomEns' => 'required',
            'emailEns' => 'required|email',
            'mdpEns' => 'required|min:6|max:12',
        ];
    }
}
