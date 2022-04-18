<?php


namespace App\Modules\WorkingHour\Controllers;


use App\Http\Controllers\Controller;
use App\Modules\WorkingHour\Models\WorkingHour;
use Carbon\Carbon;
use Illuminate\Http\Request;

class WorkingHourController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

    }


    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        foreach ($request['events'] as $event) {
            if (array_key_exists('color', $event) and $event['color'] == 'green') {
                if (array_key_exists('id', $event)) {
                    $old_event = WorkingHour::findOrFail($event['id']);
                    $old_event->update([
                        'start' => Carbon::parse($event['start']),
                        'end' => Carbon::parse($event['end'])]);
                } else {
                    WorkingHour::create([
                        'start' => Carbon::parse($event['start']),
                        'end' => Carbon::parse($event['end']),
                        'user_id' => $event['user_id']
                    ]);
                }
            }
        }

        return ['message' => "Рабочий график сотрудника успешно обновлен"];
    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show(int $id)
    {

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

    }
}
