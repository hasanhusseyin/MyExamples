using Core.Extensions;
using Core.Utilities.Security.Encription;
using Entities.Concrete;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace Core.Utilities.Security.Jwt
{
    public class JwtHelper : ITokenHelper
    {
        public IConfiguration Configuration { get; }
        private TokenOptions _tokenOptions;
        private DateTime _accessTokenExpriration;

        public JwtHelper(IConfiguration configuration)
        {
            Configuration = configuration;
            _tokenOptions = Configuration.GetSection("TokenOptions").Get<TokenOptions>();
            _accessTokenExpriration = DateTime.Now.AddMinutes(
                _tokenOptions.AccessTokenExpriration + 10
            );
        }

        public AccessToken CreateToken(User user, List<OperationClaim> operationClaims)
        {
            var securityKey = SecurityKeyHelper.CreateSecurityKey(_tokenOptions.SecurityKey);
            var signingCrediantials = SigningCredentialsHelper.CreateSigningCredentials(
                securityKey
            );
            var jwt = CreateJwtSecurityToken(
                _tokenOptions,
                user,
                signingCrediantials,
                operationClaims
            );
            var jwtSecurityTokenHandler = new JwtSecurityTokenHandler();
            var token = jwtSecurityTokenHandler.WriteToken(jwt);
            return new AccessToken { Token = token, Expiration = _accessTokenExpriration, };
        }

        public JwtSecurityToken CreateJwtSecurityToken(
            TokenOptions _tokenOptions,
            User user,
            SigningCredentials signingCredentials,
            List<OperationClaim> operationClaims
        )
        {
            var jwt = new JwtSecurityToken(
                issuer: _tokenOptions.Issuer,
                audience: _tokenOptions.Audience,
                notBefore: DateTime.Now,
                expires: _accessTokenExpriration,
                claims: SetClaims(user, operationClaims),
                signingCredentials: signingCredentials
            );
            ;
            return jwt;
        }

        private IEnumerable<Claim> SetClaims(User user, List<OperationClaim> operationClaims)
        {
            var claims = new List<Claim>();
            claims.AddNameIdentifier(user.Id.ToString());
            claims.AddEmail(user.Email);
            claims.AddName($"{user.FirstName} {user.LastName}");
            claims.AddRoles(operationClaims.Select(c => c.Name).ToArray());
            return claims;
        }
    }
}
