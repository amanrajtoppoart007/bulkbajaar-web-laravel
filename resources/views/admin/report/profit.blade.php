@extends("layouts.admin")
@section("content")
    <div class="content bg-white">
        <form method="get" action="{{route('admin.report.profit')}}">
            <div class="row">
            <div class="col-md-3">
                <div class="form-group m-3">
                     <label for="year">Year</label>
                    <div class="input-group">
                        <select name="year" id="year" class="form-control">
                            @for($i=2020;$i<=now()->format('Y');$i++)
                                <option value="{{$i}}" {{$i==request()->input('year',2022)?'selected':''}}>{{$i}}</option>
                            @endfor
                        </select>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </div>
            </div>
        </div>
        </form>
        <div class="m-2">
            <h5>Monthly Income </h5>
        </div>
        <div class="row">
            <div class="col-md-9 m-2">
                <canvas id="monthlyIncomeChart"></canvas>
            </div>
        </div>
        <div class="m-2">
            <h5>Monthly Revenue </h5>
        </div>
        <div class="row">
            <div class="col-md-9 m-2">
                <canvas id="monthlyRevenueChart"></canvas>
            </div>
        </div>
    </div>

@endsection
@section("scripts")
     <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
     <script>
const ctx = document.getElementById('monthlyIncomeChart').getContext('2d');
const myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['January', 'February', 'March', 'April', 'May', 'June','July','August','September','October','November','December'],
        datasets: [{
            label: '# Grand Total',
            data: {!! json_encode($monthlySellAmount) !!},
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)',
                'rgba(255, 50, 64, 0.2)',
                'rgba(255, 50, 122, 0.2)',
                'rgba(255, 255, 122, 0.2)',
                'rgba(50, 255, 122, 0.2)',
                'rgba(50, 255, 255, 0.2)',
                'rgba(255, 255, 0, 0.2)',
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)',
                'rgba(255, 50, 64, 1)',
                'rgba(255, 50, 122, 1)',
                'rgba(255, 255, 122, 1)',
                'rgba(50, 255, 122, 1)',
                'rgba(50, 255, 255, 1)',
                'rgba(255, 255, 0, 1)',
            ],
            borderWidth: 1
        }]
    },
    options: {
        responsive: true,
        scales: {
            y: {
                beginAtZero: true
            }
        },
         height: '100px',
    }
});

const mCtx = document.getElementById('monthlyRevenueChart').getContext('2d');
const monthlyRevenueChart = new Chart(mCtx, {
    type: 'bar',
    data: {
        labels: ['January', 'February', 'March', 'April', 'May', 'June','July','August','September','October','November','December'],
        datasets: [{
            label: '# Portal Revenue Total',
            data: {!! json_encode($monthlyEarning) !!},
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)',
                'rgba(255, 50, 64, 0.2)',
                'rgba(255, 50, 122, 0.2)',
                'rgba(255, 255, 122, 0.2)',
                'rgba(50, 255, 122, 0.2)',
                'rgba(50, 255, 255, 0.2)',
                'rgba(255, 255, 0, 0.2)',
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)',
                'rgba(255, 50, 64, 1)',
                'rgba(255, 50, 122, 1)',
                'rgba(255, 255, 122, 1)',
                'rgba(50, 255, 122, 1)',
                'rgba(50, 255, 255, 1)',
                'rgba(255, 255, 0, 1)',
            ],
            borderWidth: 1
        }]
    },
    options: {
        responsive: true,
        scales: {
            y: {
                beginAtZero: true
            }
        },
         height: '100px',
    }
});
</script>
@endsection
