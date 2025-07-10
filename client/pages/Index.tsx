import { useNavigate } from "react-router-dom";

export default function Index() {
  const navigate = useNavigate();

  const handleGetStarted = () => {
    navigate("/login");
  };

  return (
    <div className="min-h-screen handyhub-gradient flex flex-col">
      {/* Hero Section */}
      <div className="flex-1 flex flex-col items-center justify-center px-4 py-8">
        {/* Hero Image */}
        <div className="w-full max-w-sm mb-8">
          <div className="relative">
            {/* Placeholder for handyman image - in production would be an actual image */}
            <div className="w-full h-64 bg-gradient-to-br from-handyhub-blue-200 to-handyhub-blue-300 rounded-2xl flex items-center justify-center">
              <div className="text-center">
                <div className="w-20 h-20 bg-handyhub-orange-400 rounded-full mx-auto mb-4 flex items-center justify-center">
                  <svg
                    className="w-10 h-10 text-white"
                    fill="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path d="M22.7 19l-9.1-9.1c.9-2.3.4-5-1.5-6.9-2-2-5-2.4-7.4-1.3L9 6 6 9 1.6 4.7C.4 7.1.9 10.1 2.9 12.1c1.9 1.9 4.6 2.4 6.9 1.5l9.1 9.1c.4.4 1 .4 1.4 0l2.3-2.3c.5-.4.5-1.1.1-1.4zM6.7 8.8c-.7.7-1.9.7-2.6 0-.7-.7-.7-1.9 0-2.6.7-.7 1.9-.7 2.6 0 .7.7.7 1.9 0 2.6z" />
                  </svg>
                </div>
                <div className="text-handyhub-blue-600 font-semibold text-lg">
                  Expert Handyman
                </div>
              </div>
            </div>
          </div>
        </div>

        {/* Content Card */}
        <div className="w-full max-w-sm">
          <div className="bg-white rounded-3xl p-8 handyhub-card-shadow">
            <div className="text-center">
              <h1 className="text-2xl font-bold text-handyhub-gray-800 mb-4 leading-tight">
                Ready to Fix Your Home with HandyHub
              </h1>

              <p className="text-handyhub-gray-600 mb-8 leading-relaxed">
                Connect with skilled professionals for all your home repair and
                maintenance needs. Quick, reliable, and trusted service at your
                fingertips.
              </p>

              {/* Get Started Button */}
              <button
                onClick={handleGetStarted}
                className="w-full bg-gradient-to-r from-handyhub-orange-400 to-handyhub-orange-500 text-white font-semibold py-4 px-6 rounded-2xl shadow-lg hover:shadow-xl transition-all duration-200 active:scale-95"
              >
                Get Started
              </button>

              {/* Skip/Login Link */}
              <div className="mt-6">
                <button
                  onClick={() => navigate("/login")}
                  className="text-handyhub-gray-500 text-sm hover:text-handyhub-gray-700 transition-colors"
                >
                  Already have an account? Log in
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* Bottom Safe Area for Mobile */}
      <div className="h-4 md:h-8"></div>
    </div>
  );
}
