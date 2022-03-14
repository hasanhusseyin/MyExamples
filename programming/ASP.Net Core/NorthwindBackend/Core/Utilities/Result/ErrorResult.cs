using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Utilities.Result
{
    internal class ErrorResult : Result
    {
        public ErrorResult() : base(false)
        {
        }

        public ErrorResult(bool success, string message) : base(false, message)
        {
        }
    }
}
