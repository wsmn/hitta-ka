<template>
    <div class="mx-auto bg-gray-100 border border-gray-400 p-8 lg:p-16">
        <div class="mx-auto text-center">
            <h1 class="text-2xl md:text-4xl font-sans font-semibold">
                Behöver du en KA?
            </h1>
        </div>
        <div class="flex flex-wrap mt-8">
            <div class="w-full lg:w-3/5">
                <h2 class="text-2xl font-semibold">
                    Ditt projekt
                </h2>
                <p class="text-gray-600 text-base whitespace-pre-line">Frågorna nedan kan hjälpa dig reda ut om du behöver en kontrollansvarig till ditt
                    byggprojekt eller ej.
                </p>
                <h3 class="text-xl font-semibold mt-6">
                    Bygglov
                </h3>
                <p class="text-gray-600 text-base whitespace-pre-line">Kräver arbetet bygglov eller anmälan?
                </p>
                <label class="w-full lg:w-3/4 relative block border border-gray-400 hover:bg-green-100 hover:border-green-300 rounded mt-6 p-3" :class="{'bg-green-100 border-green-500': permit == 'needed'}">
                    <div class="absolute right-0 top-0 p-3" :class="{'hidden': permit != 'needed'}">
                        <div class="rounded-full bg-green-200 h-6 w-6 flex items-center justify-center inline">
                            <i class="fas fa-check text-green-800 fa-sm"></i>
                        </div>
                    </div>
                    <input type="radio" class="hidden" v-model="permit" value="needed"><p class="inline-block font-bold leading-none">Bygglov krävs</p>
                    <p class="text-sm text-gray-600 font-medium">Har du redan koll på om det krävs bygglov för ditt projekt?</p>
                </label>
                <label class="w-full lg:w-3/4 relative block border border-gray-400 hover:bg-green-100 hover:border-green-300 rounded mt-2 p-3" :class="{'bg-green-100 border-green-500': permit == 'not_needed'}">
                    <div class="absolute right-0 top-0 p-3" :class="{'hidden': permit != 'not_needed'}">
                        <div class="rounded-full bg-green-200 h-6 w-6 flex items-center justify-center inline">
                            <i class="fas fa-check text-green-800 fa-sm"></i>
                        </div>
                    </div>
                    <input type="radio" class="hidden" v-model="permit" value="not_needed"><p class="inline-block font-bold leading-none">Nej, inget bygglov behövs</p>
                    <p class="text-sm text-gray-600 font-medium">Behöver man inget bygglov för att utföra den förändring ni planerat?</p>
                </label>
                <label class="w-full lg:w-3/4 relative block border border-gray-400 hover:bg-green-100 hover:border-green-300 rounded p-3" :class="{'bg-green-100 border-green-500': permit == 'unknown'}">
                    <div class="absolute right-0 top-0 p-3" :class="{'hidden': permit != 'unknown'}">
                        <div class="rounded-full bg-green-200 h-6 w-6 flex items-center justify-center inline">
                            <i class="fas fa-check text-green-800 fa-sm"></i>
                        </div>
                    </div>
                    <input type="radio" class="hidden" v-model="permit" value="unknown"><p class="inline-block font-bold leading-none">Vet ej</p>
                    <p class="text-sm text-gray-600 font-medium">Välj det här alternativet ifall du inte vet om det behövs bygglov eller ej.</p>
                </label>
            </div>
            <div class="w-full lg:w-2/5 mx-auto pl-16 hidden lg:block">
                <h2 class="text-2xl font-semibold">
                    Info
                </h2>
                <p class="mt-2">
                    Har du några mer funderingar och tankar så hänvisar vi till boverket hemsida.
                </p>
                <p class="mt-2">
                    <a
                    href="https://boverket.se"
                    class="text-blue-600 hover:text-blue-400 font-semibold"
                    target="_blank"
                    >Boverket</a>
                </p>
                <h2 class="text-xl font-semibold mt-12">
                    Fråga
                </h2>
                <p class="mt-2">
                    Är du det minsta osäker på om ditt projekt behöver en kontrollansvarig eller ej så rekommenderar vi att kontakta
                    Byggnadsnämden i din kommun. Du kan använda vårt verktyg <span class="font-semibold text-blue-600">här</span> för att skapa en förfrågan
                    anpassat för det här ändamålet.
                </p>
            </div>
            <transition name="fade" mode="out-in">
                <div class="w-1/2 mx-auto text-center mt-16" v-show="permit === 'needed'">
                    <h3 class="text-xl font-semibold mt-6">
                        <p class="text-green-400 text-3xl">Bra!</p>
                        Du har redan koll på att ditt projekt kräver bygglov.
                    </h3>
                    <p class="text-lg text-gray-600 mt-2">
                        I och med att ditt projekt kräver bygglov eller anmälan behöver du med största sannolikhet en kontrollansvarig.
                    </p>
                </div>
            </transition>
            <transition name="fade" mode="out-in">
                <div class="w-1/2 mx-auto text-center mt-16" v-show="permit === 'not_needed'">
                    <h3 class="text-xl font-semibold mt-6">
                        <p class="text-green-400 text-3xl">Ditt projekt behöver inte bygglov.</p>
                        Du har redan koll på att ditt projekt inte behöver bygglov.
                    </h3>
                    <p class="text-lg text-gray-600 mt-2">
                        I och med att ditt projekt inte kräver något bygglov behöver du antagligen inte heller någon kontrollansvarig.
                        För att vara säker bör du kontakta din kommun eller läsa på deras hemsida.
                        {Välj kommun}
                    </p>
                </div>
            </transition>
            <transition name="fade" mode="out-in">
                <div class="w-full mt-8" v-show="permit === 'unknown'">
                    <div class="mx-auto text-center">
                        <h3 class="text-2xl text-yellow-600 font-semibold mt-6 whitespace-pre-line">
                            Du är osäker på om du behöver bygglov eller anmäla ditt byggprojekt.
                            Svara på frågorna nedanför.
                        </h3>
                    </div>
                    <div class="w-1/2 mt-12">
                        <h3 class="text-xl font-semibold mt-6">
                            Projekttyp
                        </h3>
                        <p class="text-gray-600 mt-1">
                            Vad för typ av byggprojekt skall genomföras?
                        </p>
                        <div class="flex flex-wrap -mx-2">
                            <div class="w-1/2 lg:w-1/4 px-2">
                                <label class="relative border block border-gray-300 hover:bg-greeb-100 hover:border-green-300 rounded mt-4 py-2 px-3" :class="{'bg-green-100 border-green-500': project_type == 'build'}">
                                    <input type="radio" class="hidden" v-model="project_type" value="build">
                                    <div class="text-sm font-bold leading-none inline">
                                        Bygga
                                    </div>
                                    <div class="absolute right-0 top-0 p-3" :class="{'hidden': project_type != 'build'}">
                                        <div class="rounded-full bg-green-200 h-5 w-5 flex items-center justify-center inline">
                                            <i class="fas fa-check text-green-800 fa-xs"></i>
                                        </div>
                                    </div>
                                    <div class="flex justify-center items-center p-3">
                                        <i class="fas fa-home text-green-700 fa-2x"></i>
                                    </div>
                                </label>
                            </div>
                            <div class="w-1/2 lg:w-1/4 px-2">
                                <label class="relative border block border-gray-300 hover:bg-greeb-100 hover:border-green-300 rounded mt-4 py-2 px-3" :class="{'bg-green-100 border-green-500': project_type == 'renovate'}">
                                    <input type="radio" class="hidden" v-model="project_type" value="renovate">
                                    <div class="text-sm font-semibold leading-none inline">
                                        Renovering
                                    </div>
                                    <div class="absolute right-0 top-0 p-3" :class="{'hidden': project_type != 'renovate'}">
                                        <div class="rounded-full bg-green-200 h-5 w-5 flex items-center justify-center inline">
                                            <i class="fas fa-check text-green-800 fa-xs"></i>
                                        </div>
                                    </div>
                                    <div class="flex justify-center items-center p-3">
                                        <i class="fas fa-tools text-green-700 fa-2x"></i>
                                    </div>
                                </label>
                            </div>
                            <div class="w-1/2 lg:w-1/4 px-2">
                                <label class="relative border block border-gray-300 hover:bg-greeb-100 hover:border-green-300 rounded mt-4 py-2 px-3" :class="{'bg-green-100 border-green-500': project_type == 'groundwork'}">
                                    <input type="radio" class="hidden" v-model="project_type" value="groundwork">
                                    <div class="text-sm font-semibold leading-none inline">
                                        Markarbete
                                    </div>
                                    <div class="absolute right-0 top-0 p-3" :class="{'hidden': project_type != 'groundwork'}">
                                        <div class="rounded-full bg-green-200 h-5 w-5 flex items-center justify-center inline">
                                            <i class="fas fa-check text-green-800 fa-xs"></i>
                                        </div>
                                    </div>
                                    <div class="flex justify-center items-center p-3">
                                        <i class="fas fa-tractor text-green-700 fa-2x"></i>
                                    </div>
                                </label>
                            </div>
                            <div class="w-1/2 lg:w-1/4 px-2">
                                <label class="relative border block border-gray-300 hover:bg-greeb-100 hover:border-green-300 rounded mt-4 py-2 px-3" :class="{'bg-green-100 border-green-500': project_type == 'other'}">
                                    <input type="radio" class="hidden" v-model="project_type" value="other">
                                    <div class="text-sm font-semibold leading-none inline">
                                        Annat
                                    </div>
                                    <div class="absolute right-0 top-0 p-3" :class="{'hidden': project_type != 'other'}">
                                        <div class="rounded-full bg-green-200 h-5 w-5 flex items-center justify-center inline">
                                            <i class="fas fa-check text-green-800 fa-xs"></i>
                                        </div>
                                    </div>
                                    <div class="flex justify-center items-center p-3">
                                        <i class="fas fa-question-circle text-green-700 fa-2x"></i>
                                    </div>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </transition>
            <transition name="fade" mode="out-in">
                <div class="w-full" v-show="project_type === 'build' && permit == 'unknown'">
                    <div class="w-full mt-8">
                        <h3 class="text-base font-semibold mt-6">
                            Bygga
                        </h3>
                        <p class="text-sm text-gray-600">
                            Du planerar någon form av bygge, smått som stort.
                        </p>
                        <div class="w-full lg:w-3/5">
                            <label class="w-full lg:w-3/4 relative block border border-gray-300 hover:bg-green-100 hover:border-green-300 rounded mt-4 p-3" :class="{'bg-green-100 border-green-500': build_type == 'build'}">
                                <div class="absolute right-0 top-0 p-3" :class="{'hidden': build_type != 'build'}">
                                    <div class="rounded-full bg-green-200 h-6 w-6 flex items-center justify-center inline">
                                        <i class="fas fa-check text-green-800 fa-sm"></i>
                                    </div>
                                </div>
                                <input type="radio" class="hidden" v-model="build_type" value="build"><p class="inline-block text-sm font-bold leading-none">Bygga nytt</p>
                                <p class="text-sm text-gray-600 font-medium">Ska du bygga nytt eller bygga till?</p>
                            </label>
                            <label class="w-full lg:w-3/4 relative block border border-gray-300 hover:bg-green-100 hover:border-green-300 rounded mt-4 p-3" :class="{'bg-green-100 border-green-500': build_type == 'expand'}">
                                <div class="absolute right-0 top-0 p-3" :class="{'hidden': build_type != 'expand'}">
                                    <div class="rounded-full bg-green-200 h-6 w-6 flex items-center justify-center inline">
                                        <i class="fas fa-check text-green-800 fa-sm"></i>
                                    </div>
                                </div>
                                <input type="radio" class="hidden" v-model="build_type" value="expand"><p class="inline-block text-sm font-bold leading-none">Tillbyggnad</p>
                                <p class="text-sm text-gray-600 font-medium">Behöver man inget bygglov för att utföra den förändring ni planerat?</p>
                            </label>
                            <label class="w-full lg:w-3/4 relative block border border-gray-300 hover:bg-green-100 hover:border-green-300 rounded mt-4 p-3" :class="{'bg-green-100 border-green-500': build_type == 'shed'}">
                                <div class="absolute right-0 top-0 p-3" :class="{'hidden': build_type != 'shed'}">
                                    <div class="rounded-full bg-green-200 h-6 w-6 flex items-center justify-center inline">
                                        <i class="fas fa-check text-green-800 fa-sm"></i>
                                    </div>
                                </div>
                                <input type="radio" class="hidden" v-model="build_type" value="shed"><p class="inline-block text-sm font-bold leading-none">Friggebod</p>
                                <p class="text-sm text-gray-600 font-medium">Ej större än 15 kvadratmeter eller högre än 3 meter.</p>
                            </label>
                        </div>
                    </div>
                </div>
            </transition>
        </div>
    </div>
</template>

<script>
    export default {
      name: 'Questionnaire',
      data() {
        return {
          permit: null,
          project_type: null,
          build_type: null

        };
        show: true
      }
    };
</script>

<style scoped>
.fade-enter-active {
    transition: opacity 1.2s ease;
}
.fade-leave-active {
    transition: 0s;
}
</style>
