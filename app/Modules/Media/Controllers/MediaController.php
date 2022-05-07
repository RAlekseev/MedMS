<?php


namespace App\Modules\Media\Controllers;


use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class MediaController extends Controller
{
    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $model = $request['model']::findOrFail($request['id']);
        $media = $model->addMedia($request->file('file'))->toMediaCollection('documents');
        if ($request['doc_template_id']) {
            $media->update(['doc_template_id' => $request['doc_template_id']]);
        }
        return [
            'model' => $model,
            'message' => 'Документ успешно загружен',
        ];
    }

    public function get(Request $request)
    {
        $model = $request['model']::findOrFail($request['id']);
        $media = $model->getMedia('documents');
        $files = [];
        foreach ($media as $file) {
            $path = $file->getPath();
            $type = pathinfo($path, PATHINFO_EXTENSION);
            $data   = file_get_contents($path);
            $files[$file->doc_template_id] = 'data:application/' . $type . ';base64,' . base64_encode($data);
        }

        return ['files' => $files];
    }

}
