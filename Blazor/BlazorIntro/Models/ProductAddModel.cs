using System.ComponentModel.DataAnnotations;

namespace BlazorIntro.Models
{
    public class ProductAddModel
    {
        [Required]
        [StringLength(20)]
        public string Description { get; set; }

        [Required]
        [StringLength(25)]
        public string ProductName { get; set; }

        [Required]
        public string CategoryId { get; set; }
    }
}
