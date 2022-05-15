using System;

namespace MyWallet.API
{
    public static class Settings
    {
        public static string ChaveSecreta = Guid.NewGuid().ToString();
    }
}
