<script>
    function confirmDelete() {
        Swal.fire({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.isConfirmed) {
                // Proceed with deletion, e.g., submit a form or call a server-side method
                // You can use AJAX to send the authorId to the server for deletion
                // ...
                return true; // Allow the postback to proceed
            } else {
                return false; // Cancel the deletion
            }
        })
    }
</script>