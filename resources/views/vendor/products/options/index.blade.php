@extends("vendor.layout.main")
@section("content")
    <div class="card">
        <div class="card-header">
            <div class="row">
                <div class="col"><h6 class="text-success">Product Options</h6></div>
                <div class="col text-right">
                    <a href="{{route('vendor.options.create',$product_id)}}" class="btn btn-success">Add Options</a>
                </div>
            </div>

        </div>
        <div class="card-body">
            @includeIf('vendor.products.relationships.productOptions', ['productOptions' => $options])
        </div>
    </div>
@endsection
@section("scripts")
    <script>
        $(document).ready(function(){
           $(document).on('click','.delete-option-btn',function(e){
               e.preventDefault();
               const deleteUrl = $(this).attr('data-delete-url');
               Swal.fire({
                   title: 'Are you want to delete this option?',
                   showDenyButton: true,
                   showCancelButton: false,
                   confirmButtonText: 'Yes',
                   denyButtonText: `No`,
               }).then((choice) => {
                  const {isConfirmed=false,isDenied=true} = choice
                   if (isConfirmed) {
                       $.ajax({
                           url:deleteUrl,
                           method:'POST',
                           headers: { 'x-csrf-token':_token},
                           data: { _method: 'DELETE'},
                           success:function(response)
                           {
                               if(response.status===1)
                               {
                                   $.toast({
                                       heading: 'Success',
                                       text: response?.message,
                                       showHideTransition: 'slide',
                                       icon: 'success',
                                       position: 'top-right',
                                   });
                               }
                               else
                               {
                                  $.toast({
                                       heading: 'Success',
                                       text: response?.message,
                                       showHideTransition: 'slide',
                                       icon: 'success',
                                       position: 'top-right',
                                   });
                               }

                           },
                           complete:function()
                           {
                              location.reload();
                           }
                       })
                   } else if (isDenied) {
                       Swal.fire('User action cancelled', '', 'info')
                   }
               });
           });
        });
    </script>
@endsection
