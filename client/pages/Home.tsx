import { useState } from "react";

export default function Home() {
  const [searchQuery, setSearchQuery] = useState("");

  const serviceCategories = [
    { name: "Electrical", icon: "⚡", color: "handyhub-yellow-400" },
    { name: "Plumbing", icon: "🔧", color: "handyhub-blue-400" },
    { name: "Air Conditioning", icon: "❄️", color: "handyhub-orange-400" },
    { name: "Installations", icon: "🔨", color: "handyhub-blue-500" },
  ];

  const recommendations = [
    {
      title: "Home Electrical Inspection",
      provider: "ElectricPro Services",
      rating: 4.8,
      price: "$85",
      image: "⚡",
    },
    {
      title: "Kitchen Faucet Repair",
      provider: "PlumbMaster Solutions",
      rating: 4.9,
      price: "$65",
      image: "🔧",
    },
    {
      title: "AC Unit Maintenance",
      provider: "CoolAir Specialists",
      rating: 4.7,
      price: "$120",
      image: "❄️",
    },
  ];

  return (
    <div className="min-h-screen bg-handyhub-gray-50">
      {/* Header with Gradient */}
      <div className="handyhub-gradient">
        <div className="px-6 pt-12 pb-8">
          {/* User Greeting */}
          <div className="flex items-center justify-between mb-8">
            <div>
              <p className="text-white/80 text-sm">Good Morning,</p>
              <h1 className="text-white text-2xl font-bold">Sarah Johnson</h1>
            </div>
            <div className="w-12 h-12 bg-white/20 rounded-full flex items-center justify-center">
              <span className="text-white text-xl">👤</span>
            </div>
          </div>

          {/* Search Bar */}
          <div className="relative">
            <input
              type="text"
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              placeholder="What service do you need?"
              className="w-full bg-white rounded-2xl py-4 px-6 pr-12 text-handyhub-gray-800 placeholder-handyhub-gray-500 shadow-lg focus:outline-none focus:ring-2 focus:ring-white/30"
            />
            <div className="absolute right-4 top-1/2 transform -translate-y-1/2">
              <svg
                className="w-6 h-6 text-handyhub-gray-400"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  strokeWidth={2}
                  d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
                />
              </svg>
            </div>
          </div>
        </div>
      </div>

      {/* Content */}
      <div className="px-6 -mt-4">
        {/* Promotional Banner */}
        <div className="handyhub-button-orange rounded-2xl p-6 shadow-lg mb-8">
          <div className="flex items-center justify-between">
            <div className="flex-1">
              <h3 className="text-white font-bold text-lg mb-2">
                🎉 Special Offer
              </h3>
              <p className="text-white/90 text-sm mb-3">
                Get 20% off your first booking with code FIRST20
              </p>
              <div className="inline-block bg-white/20 px-3 py-1 rounded-lg">
                <span className="text-white font-bold text-sm tracking-wider">
                  FIRST20
                </span>
              </div>
            </div>
            <div className="w-16 h-16 bg-white/20 rounded-2xl flex items-center justify-center ml-4">
              <span className="text-white text-2xl">🏷️</span>
            </div>
          </div>
        </div>

        {/* Service Categories */}
        <div className="mb-8">
          <h2 className="text-handyhub-gray-800 text-xl font-bold mb-4">
            Our Services
          </h2>
          <div className="grid grid-cols-2 gap-4">
            {serviceCategories.map((category, index) => (
              <div
                key={index}
                className="bg-white rounded-2xl p-6 handyhub-card-shadow"
              >
                <div
                  className={`w-14 h-14 bg-${category.color}/10 rounded-2xl flex items-center justify-center mb-4`}
                >
                  <span className="text-2xl">{category.icon}</span>
                </div>
                <h3 className="text-handyhub-gray-800 font-semibold">
                  {category.name}
                </h3>
              </div>
            ))}
          </div>
        </div>

        {/* Recommendations */}
        <div className="mb-8">
          <div className="flex items-center justify-between mb-4">
            <h2 className="text-handyhub-gray-800 text-xl font-bold">
              Recommended for You
            </h2>
            <button className="text-handyhub-blue-400 font-semibold text-sm">
              See All
            </button>
          </div>

          <div className="space-y-4">
            {recommendations.map((rec, index) => (
              <div
                key={index}
                className="bg-white rounded-2xl p-4 handyhub-card-shadow"
              >
                <div className="flex items-center">
                  <div className="w-14 h-14 bg-handyhub-gray-200 rounded-xl flex items-center justify-center mr-4">
                    <span className="text-2xl">{rec.image}</span>
                  </div>
                  <div className="flex-1">
                    <h3 className="text-handyhub-gray-800 font-semibold text-base">
                      {rec.title}
                    </h3>
                    <p className="text-handyhub-gray-500 text-sm">
                      {rec.provider}
                    </p>
                    <div className="flex items-center justify-between mt-2">
                      <div className="flex items-center">
                        <span className="text-handyhub-yellow-400 text-sm">
                          ⭐
                        </span>
                        <span className="text-handyhub-gray-600 text-sm ml-1 font-medium">
                          {rec.rating}
                        </span>
                      </div>
                      <span className="text-handyhub-orange-400 font-bold text-lg">
                        {rec.price}
                      </span>
                    </div>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>

      {/* Bottom Navigation */}
      <div className="fixed bottom-0 left-0 right-0 bg-white border-t border-handyhub-gray-200 px-6 py-4">
        <div className="flex items-center justify-around">
          <div className="flex flex-col items-center">
            <div className="w-6 h-6 text-handyhub-blue-400 mb-1">🏠</div>
            <span className="text-handyhub-blue-400 text-xs font-medium">
              Home
            </span>
          </div>
          <div className="flex flex-col items-center">
            <div className="w-6 h-6 text-handyhub-gray-400 mb-1">🔍</div>
            <span className="text-handyhub-gray-400 text-xs">Search</span>
          </div>
          <div className="flex flex-col items-center">
            <div className="w-6 h-6 text-handyhub-gray-400 mb-1">📋</div>
            <span className="text-handyhub-gray-400 text-xs">Bookings</span>
          </div>
          <div className="flex flex-col items-center">
            <div className="w-6 h-6 text-handyhub-gray-400 mb-1">💬</div>
            <span className="text-handyhub-gray-400 text-xs">Messages</span>
          </div>
          <div className="flex flex-col items-center">
            <div className="w-6 h-6 text-handyhub-gray-400 mb-1">👤</div>
            <span className="text-handyhub-gray-400 text-xs">Profile</span>
          </div>
        </div>
      </div>

      {/* Bottom padding for navigation */}
      <div className="h-20"></div>
    </div>
  );
}
