<?php

namespace App\Modules\Icon\Models;

use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;


class Icon extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'icon_type_id',
        'source',
    ];

    public function type() {
        return $this->belongsTo(IconType::class, 'icon_type_id');
    }

    public function storeFile(Request $request): string {
        $file = $request->file('icon');
        $filename = $request['name'] . '.' . $file->getClientOriginalExtension();

        if (Icon::where('source', $filename)->count()) {
            return response()->json([
                'message' => 'Иконка с тааким именем уже существует',
                'status' => 422
            ], 422);
        }

        Storage::disk('public')->putFileAs('icons', $file, $filename);

        return $filename;
    }

    public $timestamps = false;
}
