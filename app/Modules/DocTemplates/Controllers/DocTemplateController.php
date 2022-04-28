<?php


namespace App\Modules\DocTemplates\Controllers;


use App\Http\Controllers\Controller;
use App\Modules\DocTemplates\Models\DocTemplate;
use Illuminate\Http\Request;

class DocTemplateController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return DocTemplate::all();
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $doc_template = DocTemplate::create([
            'name' => $request['name'],
            'table' => $request['table'],
        ]);

        return response()->json([
            'doc_template' => $doc_template,
            'message' => "Шаблон документа успешно добавлен"
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show(int $id)
    {
        return DocTemplate::findOrFail($id);
    }


    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $doc_template = DocTemplate::findOrFail($id);

        $doc_template->fill($request->all())->save();

        return ['doc_template' => $doc_template,
            'message' => "Шаблон документа {$doc_template->name} успешно изменен"];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     * @throws \Exception
     */
    public function destroy(int $id)
    {
        DocTemplate::findOrFail($id)->delete();
    }
}
