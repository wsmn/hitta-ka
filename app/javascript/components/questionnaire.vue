<template>
    <div class="mx-auto bg-gray-100 border border-gray-400 px-4 py-12 md:px-12 md:py-16 lg:p-16">
        <div class="mx-auto text-center">
            <h1 class="text-3xl md:text-4xl text-gray-800 font-bold">
                Behöver du en kontrollansvarig?
            </h1>
        </div>
        <div class="flex flex-wrap mt-6 p-4 lg:p-0 lg:mt-12">
            <div class="w-full lg:w-3/5 lg:pr-12">
                <h2 class="text-2xl font-semibold">
                    Ditt projekt
                </h2>
                <p class="w-full lg:w-11/12 text-gray-600 text-base">
                    Frågorna nedan kan hjälpa dig reda ut om du behöver en kontrollansvarig till ditt byggprojekt eller ej.
                </p>
                <h3 class="text-xl font-semibold mt-6">
                    Bygglov
                </h3>
                <p class="text-gray-600 text-base whitespace-pre-line">Kräver arbetet bygglov eller anmälan?
                </p>
                <label class="w-full relative block border-2 border-gray-400 hover:bg-blue-100 hover:border-blue-300 rounded mt-6 p-3" :class="{'bg-blue-100 border-blue-500': permit == 'needed'}">
                    <div class="absolute right-0 top-0 p-3" :class="{'hidden': permit != 'needed'}">
                        <div class="rounded-full bg-blue-200 h-6 w-6 flex items-center justify-center inline">
                            <p class="text-base"><i class="fas fa-check text-blue-800 fa-sm"></i></p>
                        </div>
                    </div>
                    <input type="radio" class="hidden" v-model="permit" value="needed"><p class="inline-block font-bold leading-none">Bygglov krävs</p>
                    <p class="text-sm text-gray-600 font-medium">Har du redan koll på om det krävs bygglov för ditt projekt?</p>
                </label>
                <label class="w-full relative block border-2 border-gray-400 hover:bg-blue-100 hover:border-blue-300 rounded mt-2 p-3" :class="{'bg-blue-100 border-blue-500': permit == 'not_needed'}">
                    <div class="absolute right-0 top-0 p-3" :class="{'hidden': permit != 'not_needed'}">
                        <div class="rounded-full bg-blue-200 h-6 w-6 flex items-center justify-center inline">
                            <p class="text-base"><i class="fas fa-check text-blue-800 fa-sm"></i></p>
                        </div>
                    </div>
                    <input type="radio" class="hidden" v-model="permit" value="not_needed"><p class="inline-block font-bold leading-none">Nej, inget bygglov behövs</p>
                    <p class="text-sm text-gray-600 font-medium">Behöver man inget bygglov för att utföra den förändring ni planerat?</p>
                </label>
                <label class="w-full relative block border-2 border-gray-400 hover:bg-blue-100 hover:border-blue-300 rounded p-3" :class="{'bg-blue-100 border-blue-500': permit == 'unknown'}">
                    <div class="absolute right-0 top-0 p-3" :class="{'hidden': permit != 'unknown'}">
                        <div class="rounded-full bg-blue-200 h-6 w-6 flex items-center justify-center inline">
                            <p class="text-base"><i class="fas fa-check text-blue-800 fa-sm"></i></p>
                        </div>
                    </div>
                    <input type="radio" class="hidden" v-model="permit" value="unknown"><p class="inline-block font-bold leading-none">Vet ej</p>
                    <p class="text-sm text-gray-600 font-medium">Välj det här alternativet ifall du inte vet om det behövs bygglov eller ej.</p>
                </label>
            </div>
            <div class="w-full lg:w-2/5 mx-auto pl-8 hidden lg:block">
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
                <div class="w-4/5 lg:w-1/2 mx-auto text-center lg:mt-16" v-if="permit === 'needed'">
                    <h3 class="text-xl font-semibold mt-6">
                        <p class="text-blue-400 text-3xl">Bra!</p>
                        Du har redan koll på att ditt projekt kräver bygglov.
                    </h3>
                    <p class="text-lg text-gray-600 mt-2">
                        I och med att ditt projekt kräver bygglov eller anmälan behöver du med största sannolikhet en kontrollansvarig.
                    </p>
                </div>
            </transition>
            <transition name="fade" mode="out-in">
                <div class="w-4/5 lg:w-1/2 mx-auto text-center lg:mt-16" v-if="permit === 'not_needed'">
                    <h3 class="text-xl font-semibold mt-6">
                        <p class="text-blue-400 text-3xl">Ditt projekt behöver inte bygglov.</p>
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
                <div class="w-full mx-auto lg:mt-6" v-if="permit === 'unknown'">
                    <div class="mx-auto text-center lg:text-left">
                        <h3 class="text-2xl lg:text-2xl text-yellow-600 font-semibold whitespace-pre-line">
                            Svara på frågorna nedan.
                            Så reder vi ut ifall du behöver en kontrollansvarig.
                        </h3>
                    </div>
                    <div class="w-full lg:w-3/5 mx-auto lg:mx-0 mt-4 lg:mt-12 lg:pr-12">
                        <h3 class="text-xl font-semibold lg:mt-6">
                            1. Projekttyp
                        </h3>
                        <p class="text-gray-600 mt-1">
                            Vad för typ av byggprojekt skall genomföras?
                        </p>
                        <div class="flex flex-wrap -mx-1">
                            <div class="w-1/2 lg:w-1/4 px-1">
                                <label class="relative border-2 block border-gray-400 hover:bg-greeb-100 hover:border-blue-300 rounded mt-4 py-2 px-3" :class="{'bg-blue-100 border-blue-500': project_type == 'build'}">
                                    <input type="radio" class="hidden" v-model="project_type" value="build">
                                    <div class="text-sm font-semibold leading-none inline">
                                        Bygga
                                    </div>
                                    <div class="absolute right-0 top-0 p-2" :class="{'hidden': project_type != 'build'}">
                                        <div class="rounded-full bg-blue-200 h-5 w-5 flex items-center justify-center inline">
                                            <p class="text-sm flex items-center"><i class="fas fa-check text-blue-800 fa-xs"></i></p>
                                        </div>
                                    </div>
                                    <div class="flex justify-center items-center p-3 h-16">
                                        <i class="fas fa-home text-blue-700 fa-2x"></i>
                                    </div>
                                </label>
                            </div>
                            <div class="w-1/2 lg:w-1/4 px-1">
                                <label class="relative border-2 block border-gray-400 hover:bg-greeb-100 hover:border-blue-300 rounded mt-4 py-2 px-3" :class="{'bg-blue-100 border-blue-500': project_type == 'renovate'}">
                                    <input type="radio" class="hidden" v-model="project_type" value="renovate">
                                    <div class="text-sm font-semibold leading-none inline">
                                        Renovering
                                    </div>
                                    <div class="absolute right-0 top-0 p-2" :class="{'hidden': project_type != 'renovate'}">
                                        <div class="rounded-full bg-blue-200 h-5 w-5 flex items-center justify-center inline">
                                            <p class="text-sm flex items-center"><i class="fas fa-check text-blue-800 fa-xs"></i></p>
                                        </div>
                                    </div>
                                    <div class="flex justify-center items-center p-3 h-16">
                                        <i class="fas fa-tools text-blue-700 fa-2x"></i>
                                    </div>
                                </label>
                            </div>
                            <div class="w-1/2 lg:w-1/4 px-1">
                                <label class="relative border-2 block border-gray-400 hover:bg-greeb-100 hover:border-blue-300 rounded mt-4 py-2 px-3" :class="{'bg-blue-100 border-blue-500': project_type == 'groundwork'}">
                                    <input type="radio" class="hidden" v-model="project_type" value="groundwork">
                                    <div class="text-sm font-semibold leading-none inline">
                                        Markarbete
                                    </div>
                                    <div class="absolute right-0 top-0 p-2" :class="{'hidden': project_type != 'groundwork'}">
                                        <div class="rounded-full bg-blue-200 h-5 w-5 flex items-center justify-center inline">
                                            <p class="text-sm flex items-center"><i class="fas fa-check text-blue-800 fa-xs"></i></p>
                                        </div>
                                    </div>
                                    <div class="flex justify-center items-center p-3 h-16">
                                        <p class="text-sm flex items-center"><i class="fas fa-tractor text-blue-700 fa-2x"></i></p>
                                    </div>
                                </label>
                            </div>
                            <div class="w-1/2 lg:w-1/4 px-1">
                                <label class="relative border-2 block border-gray-400 hover:bg-greeb-100 hover:border-blue-300 rounded mt-4 py-2 px-3" :class="{'bg-blue-100 border-blue-500': project_type == 'other'}">
                                    <input type="radio" class="hidden" v-model="project_type" value="other">
                                    <div class="text-sm font-semibold leading-none inline">
                                        Annat
                                    </div>
                                    <div class="absolute right-0 top-0 p-2" :class="{'hidden': project_type != 'other'}">
                                        <div class="rounded-full bg-blue-200 h-5 w-5 flex items-center justify-center inline">
                                            <p class="text-sm flex items-center"><i class="fas fa-check text-blue-800 fa-xs"></i></p>
                                        </div>
                                    </div>
                                    <div class="flex justify-center items-center p-3 h-16">
                                        <i class="fas fa-question-circle text-blue-700 fa-2x"></i>
                                    </div>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </transition>
            <transition name="fade" mode="out-in">
                <div class="w-full" v-if="project_type === 'build' && permit == 'unknown'">
                    <div class="w-full mt-8">
                        <h3 class="text-xl font-semibold mt-6">
                            Bygga
                        </h3>
                        <p class="text-base text-gray-600">
                            Du planerar någon form av bygge, smått som stort.
                        </p>
                        <div class="w-full lg:w-3/5 lg:pr-12">
                            <label class="relative block border-2 border-gray-300 hover:bg-blue-100 hover:border-blue-300 rounded mt-4 p-3" :class="{'bg-blue-100 border-blue-500': build_type == 'build_new'}">
                                <div class="absolute right-0 top-0 p-3" :class="{'hidden': build_type != 'build_new'}">
                                    <div class="rounded-full bg-blue-200 h-6 w-6 flex items-center justify-center inline">
                                        <i class="fas fa-check text-blue-800 fa-sm"></i>
                                    </div>
                                </div>
                                <input type="radio" class="hidden" v-model="build_type" value="build_new"><p class="inline-block text-base font-bold leading-none">Bygga nytt</p>
                                <p class="text-sm text-gray-600 font-medium">Ska du bygga nytt eller bygga till?</p>
                            </label>
                            <label class="relative block border-2 border-gray-300 hover:bg-blue-100 hover:border-blue-300 rounded mt-4 p-3" :class="{'bg-blue-100 border-blue-500': build_type == 'expand'}">
                                <div class="absolute right-0 top-0 p-3" :class="{'hidden': build_type != 'expand'}">
                                    <div class="rounded-full bg-blue-200 h-6 w-6 flex items-center justify-center inline">
                                        <i class="fas fa-check text-blue-800 fa-sm"></i>
                                    </div>
                                </div>
                                <input type="radio" class="hidden" v-model="build_type" value="expand"><p class="inline-block text-base font-bold leading-none">Tillbyggnad</p>
                                <p class="text-sm text-gray-600 font-medium">Behöver man inget bygglov för att utföra den förändring ni planerat?</p>
                            </label>
                        </div>
                    </div>
                </div>
            </transition>
            <transition name="fade" mode="out-in">
                <div class="w-full" v-if="permit == 'unknown' && project_type == 'build' && build_type === 'build_new'">
                    <div class="w-full mt-8">
                        <h3 class="text-lg font-semibold mt-6">
                            Bygga nytt
                        </h3>
                        <p class="text-base text-gray-600">
                            Du planerar någon form av bygge, smått som stort.
                        </p>
                        <div class="w-full lg:w-3/5 lg:pr-12">
                            <label class="relative block border-2 border-gray-300 hover:bg-blue-100 hover:border-blue-300 rounded mt-4 p-3" :class="{'bg-blue-100 border-blue-500': build_new_type == 'build'}">
                                <div class="absolute right-0 top-0 p-3" :class="{'hidden': build_new_type != 'build'}">
                                    <div class="rounded-full bg-blue-200 h-6 w-6 flex items-center justify-center inline">
                                        <i class="fas fa-check text-blue-800 fa-sm"></i>
                                    </div>
                                </div>
                                <input type="radio" class="hidden" v-model="build_new_type" value="build"><p class="inline-block text-base font-bold leading-none">Bygga hus</p>
                                <p class="text-sm text-gray-600 font-medium">Exempel</p>
                            </label>
                            <label class="relative block border-2 border-gray-300 hover:bg-blue-100 hover:border-blue-300 rounded mt-4 p-3" :class="{'bg-blue-100 border-blue-500': build_new_type == 'expand'}">
                                <div class="absolute right-0 top-0 p-3" :class="{'hidden': build_new_type != 'expand'}">
                                    <div class="rounded-full bg-blue-200 h-6 w-6 flex items-center justify-center inline">
                                        <i class="fas fa-check text-blue-800 fa-sm"></i>
                                    </div>
                                </div>
                                <input type="radio" class="hidden" v-model="build_new_type" value="expand"><p class="inline-block text-base font-bold leading-none">Garage</p>
                                <p class="text-sm text-gray-600 font-medium">Behöver man inget bygglov för att utföra den förändring ni planerat?</p>
                            </label>
                            <label class="relative block border-2 border-gray-300 hover:bg-blue-100 hover:border-blue-300 rounded mt-4 p-3" :class="{'bg-blue-100 border-blue-500': build_new_type == 'shed'}">
                                <div class="absolute right-0 top-0 p-3" :class="{'hidden': build_new_type != 'shed'}">
                                    <div class="rounded-full bg-blue-200 h-6 w-6 flex items-center justify-center inline">
                                        <i class="fas fa-check text-blue-800 fa-sm"></i>
                                    </div>
                                </div>
                                <input type="radio" class="hidden" v-model="build_new_type" value="shed"><p class="inline-block text-base font-bold leading-none">Friggebod</p>
                                <p class="text-sm text-gray-600 font-medium">Ej större än 15 kvadratmeter eller högre än 3 meter.</p>
                            </label>
                        </div>
                    </div>
                </div>
            </transition>
            <transition name="fade" mode="out-in">
                <div class="w-full" v-if="permit == 'unknown' && project_type == 'build' && build_type === 'expand'">
                    <div class="w-full mt-8">
                        <h3 class="text-lg font-semibold mt-6">
                            Tillbyggnad
                        </h3>
                        <p class="text-base text-gray-600">
                            Du planerar någon form av tillbygge.
                        </p>
                        <div class="w-full lg:w-3/5 lg:pr-12">
                            <label class="relative block border-2 border-gray-300 hover:bg-blue-100 hover:border-blue-300 rounded mt-4 p-3" :class="{'bg-blue-100 border-blue-500': expand_type == 'expand_example1'}">
                                <div class="absolute right-0 top-0 p-3" :class="{'hidden': expand_type != 'expand_example1'}">
                                    <div class="rounded-full bg-blue-200 h-6 w-6 flex items-center justify-center inline">
                                        <i class="fas fa-check text-blue-800 fa-sm"></i>
                                    </div>
                                </div>
                                <input type="radio" class="hidden" v-model="expand_type" value="expand_example1"><p class="inline-block text-base font-bold leading-none">Tillbyggnad 1</p>
                                <p class="text-sm text-gray-600 font-medium">Exempel 1.</p>
                            </label>
                            <label class="relative block border-2 border-gray-300 hover:bg-blue-100 hover:border-blue-300 rounded mt-4 p-3" :class="{'bg-blue-100 border-blue-500': expand_type == 'expand_example2'}">
                                <div class="absolute right-0 top-0 p-3" :class="{'hidden': expand_type != 'expand_example2'}">
                                    <div class="rounded-full bg-blue-200 h-6 w-6 flex items-center justify-center inline">
                                        <i class="fas fa-check text-blue-800 fa-sm"></i>
                                    </div>
                                </div>
                                <input type="radio" class="hidden" v-model="expand_type" value="expand_example2"><p class="inline-block text-base font-bold leading-none">Tillbyggnad 2</p>
                                <p class="text-sm text-gray-600 font-medium">Exempel 2.</p>
                            </label>
                            <label class="relative block border-2 border-gray-300 hover:bg-blue-100 hover:border-blue-300 rounded mt-4 p-3" :class="{'bg-blue-100 border-blue-500': build_new_type == 'expand_example3'}">
                                <div class="absolute right-0 top-0 p-3" :class="{'hidden': expand_type != 'expand_example3'}">
                                    <div class="rounded-full bg-blue-200 h-6 w-6 flex items-center justify-center inline">
                                        <i class="fas fa-check text-blue-800 fa-sm"></i>
                                    </div>
                                </div>
                                <input type="radio" class="hidden" v-model="expand_type" value="expand_example3"><p class="inline-block text-base font-bold leading-none">Tillbyggnad 3</p>
                                <p class="text-sm text-gray-600 font-medium">Exempel 3.</p>
                            </label>
                        </div>
                    </div>
                </div>
            </transition>
            <transition name="fade" mode="out-in">
                <div class="w-full" v-if="project_type === 'renovate' && permit == 'unknown'">
                    <div class="w-full mt-8">
                        <h3 class="text-xl font-semibold mt-6">
                            Renovera
                        </h3>
                        <p class="text-base text-gray-600">
                            Du planerar någon form av renovering.
                        </p>
                        <div class="w-full lg:w-3/5 lg:pr-12">
                            <label class="relative block border-2 border-gray-300 hover:bg-blue-100 hover:border-blue-300 rounded mt-4 p-3" :class="{'bg-blue-100 border-blue-500': renovate_type == 'extensive'}">
                                <div class="absolute right-0 top-0 p-3" :class="{'hidden': renovate_type != 'extensive'}">
                                    <div class="rounded-full bg-blue-200 h-6 w-6 flex items-center justify-center inline">
                                        <i class="fas fa-check text-blue-800 fa-sm"></i>
                                    </div>
                                </div>
                                <input type="radio" class="hidden" v-model="renovate_type" value="extensive"><p class="inline-block text-base font-semibold leading-none">Omfattande renovering</p>
                                <p class="text-sm text-gray-600 font-medium">Kommer renoveringen att innefatta bärande konstruktion?</p>
                            </label>
                            <label class="relative block border-2 border-gray-300 hover:bg-blue-100 hover:border-blue-300 rounded mt-4 p-3" :class="{'bg-blue-100 border-blue-500': renovate_type == 'small'}">
                                <div class="absolute right-0 top-0 p-3" :class="{'hidden': renovate_type != 'small'}">
                                    <div class="rounded-full bg-blue-200 h-6 w-6 flex items-center justify-center inline">
                                        <i class="fas fa-check text-blue-800 fa-sm"></i>
                                    </div>
                                </div>
                                <input type="radio" class="hidden" v-model="renovate_type" value="small"><p class="inline-block text-base font-semibold leading-none">Mindre renovering</p>
                                <p class="text-sm text-gray-600 font-medium">Renovering som inte innefattar konstruktionsförändrningar.</p>
                            </label>
                            <label class="relative block border-2 border-gray-300 hover:bg-blue-100 hover:border-blue-300 rounded mt-4 p-3" :class="{'bg-blue-100 border-blue-500': renovate_type == 'shed'}">
                                <div class="absolute right-0 top-0 p-3" :class="{'hidden': renovate_type != 'shed'}">
                                    <div class="rounded-full bg-blue-200 h-6 w-6 flex items-center justify-center inline">
                                        <i class="fas fa-check text-blue-800 fa-sm"></i>
                                    </div>
                                </div>
                                <input type="radio" class="hidden" v-model="renovate_type" value="shed"><p class="inline-block text-base font-semibold leading-none">Utvändigt</p>
                                <p class="text-sm text-gray-600 font-medium">Ge exempel.</p>
                            </label>
                        </div>
                    </div>
                </div>
            </transition>
            <transition name="fade" mode="out-in">
                <div class="w-full" v-show="renovate_type === 'extensive' && project_type == 'renovate'">
                    <div class="w-full mt-8">
                        <h3 class="text-lg font-semibold mt-6">
                            Omfattande renovering
                        </h3>
                        <p class="text-base text-gray-600">
                            Du planerar någon form av renovering.
                        </p>
                        <div class="w-full lg:w-3/5 lg:pr-12">
                            <label class="relative block border-2 border-gray-300 hover:bg-blue-100 hover:border-blue-300 rounded mt-4 p-3" :class="{'bg-blue-100 border-blue-500': extensive_renovate_type == 'extensive'}">
                                <div class="absolute right-0 top-0 p-3" :class="{'hidden': extensive_renovate_type != 'extensive'}">
                                    <div class="rounded-full bg-blue-200 h-6 w-6 flex items-center justify-center inline">
                                        <i class="fas fa-check text-blue-800 fa-sm"></i>
                                    </div>
                                </div>
                                <input type="radio" class="hidden" v-model="extensive_renovate_type" value="extensive"><p class="inline-block text-base font-semibold leading-none">Berör renoveringen bärande konstruktion</p>
                                <p class="text-sm text-gray-600 font-medium">Kommer renoveringen att innefatta bärande konstruktion?</p>
                            </label>
                            <label class="relative block border-2 border-gray-300 hover:bg-blue-100 hover:border-blue-300 rounded mt-4 p-3" :class="{'bg-blue-100 border-blue-500': extensive_renovate_type == 'planning'}">
                                <div class="absolute right-0 top-0 p-3" :class="{'hidden': extensive_renovate_type != 'planning'}">
                                    <div class="rounded-full bg-blue-200 h-6 w-6 flex items-center justify-center inline">
                                        <i class="fas fa-check text-blue-800 fa-sm"></i>
                                    </div>
                                </div>
                                <input type="radio" class="hidden" v-model="extensive_renovate_type" value="planning"><p class="inline-block text-base font-semibold leading-none">Omfattande förändring till nuvarande planlösning</p>
                                <p class="text-sm text-gray-600 font-medium">Renovering som inte innefattar konstruktionsförändrningar.</p>
                            </label>
                            <label class="relative block border-2 border-gray-300 hover:bg-blue-100 hover:border-blue-300 rounded mt-4 p-3" :class="{'bg-blue-100 border-blue-500': extensive_renovate_type == 'shed'}">
                                <div class="absolute right-0 top-0 p-3" :class="{'hidden': extensive_renovate_type != 'shed'}">
                                    <div class="rounded-full bg-blue-200 h-6 w-6 flex items-center justify-center inline">
                                        <i class="fas fa-check text-blue-800 fa-sm"></i>
                                    </div>
                                </div>
                                <input type="radio" class="hidden" v-model="extensive_renovate_type" value="shed"><p class="inline-block text-base font-semibold leading-none">Inget av alternativen / osäker</p>
                                <p class="text-sm text-gray-600 font-medium">Du vet inte exakt vad som innefattas av renoveringens.</p>
                            </label>
                        </div>
                    </div>
                </div>
            </transition>
            <transition name="fade" mode="out-in">
                <div class="w-full" v-if="extensive_renovate_type === 'extensive' && permit == 'unknown'">
                    <div class="w-full mt-8">
                        <h3 class="text-lg font-semibold mt-6">
                            Bärande konstruktion
                        </h3>
                        <p class="text-base text-gray-600">
                            Du planerar någon form av renovering.
                        </p>
                        <div class="w-full lg:w-3/5 lg:pr-12">
                            <label class="relative block border-2 border-gray-300 hover:bg-blue-100 hover:border-blue-300 rounded mt-4 p-3" :class="{'bg-blue-100 border-blue-500': extensive_renovate_type == 'extensive'}">
                                <div class="absolute right-0 top-0 p-3" :class="{'hidden': extensive_renovate_type != 'extensive'}">
                                    <div class="rounded-full bg-blue-200 h-6 w-6 flex items-center justify-center inline">
                                        <i class="fas fa-check text-blue-800 fa-sm"></i>
                                    </div>
                                </div>
                                <input type="radio" class="hidden" v-model="extensive_renovate_type" value="extensive"><p class="inline-block text-base font-semibold leading-none">Berör renoveringen bärande konstruktion</p>
                                <p class="text-sm text-gray-600 font-medium">Kommer renoveringen att innefatta bärande konstruktion?</p>
                            </label>
                            <label class="relative block border-2 border-gray-300 hover:bg-blue-100 hover:border-blue-300 rounded mt-4 p-3" :class="{'bg-blue-100 border-blue-500': extensive_renovate_type == 'planning'}">
                                <div class="absolute right-0 top-0 p-3" :class="{'hidden': extensive_renovate_type != 'planning'}">
                                    <div class="rounded-full bg-blue-200 h-6 w-6 flex items-center justify-center inline">
                                        <i class="fas fa-check text-blue-800 fa-sm"></i>
                                    </div>
                                </div>
                                <input type="radio" class="hidden" v-model="extensive_renovate_type" value="planning"><p class="inline-block text-base font-semibold leading-none">Omfattande förändring till nuvarande planlösning</p>
                                <p class="text-sm text-gray-600 font-medium">Renovering som inte innefattar konstruktionsförändrningar.</p>
                            </label>
                            <label class="relative block border-2 border-gray-300 hover:bg-blue-100 hover:border-blue-300 rounded mt-4 p-3" :class="{'bg-blue-100 border-blue-500': extensive_renovate_type == 'shed'}">
                                <div class="absolute right-0 top-0 p-3" :class="{'hidden': extensive_renovate_type != 'shed'}">
                                    <div class="rounded-full bg-blue-200 h-6 w-6 flex items-center justify-center inline">
                                        <i class="fas fa-check text-blue-800 fa-sm"></i>
                                    </div>
                                </div>
                                <input type="radio" class="hidden" v-model="extensive_renovate_type" value="shed"><p class="inline-block text-base font-semibold leading-none">Inget av alternativen / osäker</p>
                                <p class="text-sm text-gray-600 font-medium">Du vet inte exakt vad som innefattas av renoveringens.</p>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="w-full" v-show="renovate_type === 'small' && project_type == 'renovate'">
                    <div class="w-full mt-8">
                        <h3 class="text-lg font-semibold mt-6">
                            Mindre renovering
                        </h3>
                        <p class="text-base text-gray-600">
                            Du planerar att göra en mindre renovering.
                        </p>
                        <div class="w-full lg:w-3/5 lg:pr-12">
                            <label class="relative block border-2 border-gray-300 hover:bg-blue-100 hover:border-blue-300 rounded mt-4 p-3" :class="{'bg-blue-100 border-blue-500': small_renovate_type == 'small'}">
                                <div class="absolute right-0 top-0 p-3" :class="{'hidden': small_renovate_type != 'small'}">
                                    <div class="rounded-full bg-blue-200 h-6 w-6 flex items-center justify-center inline">
                                        <i class="fas fa-check text-blue-800 fa-sm"></i>
                                    </div>
                                </div>
                                <input type="radio" class="hidden" v-model="small_renovate_type" value="extensive"><p class="inline-block text-base font-semibold leading-none">Typer av mindre renovering som inte kräver KA/bygglov.</p>
                                <p class="text-sm text-gray-600 font-medium">Ge exempel</p>
                            </label>
                            <label class="relative block border-2 border-gray-300 hover:bg-blue-100 hover:border-blue-300 rounded mt-4 p-3" :class="{'bg-blue-100 border-blue-500': small_renovate_type == 'planning'}">
                                <div class="absolute right-0 top-0 p-3" :class="{'hidden': small_renovate_type != 'planning'}">
                                    <div class="rounded-full bg-blue-200 h-6 w-6 flex items-center justify-center inline">
                                        <i class="fas fa-check text-blue-800 fa-sm"></i>
                                    </div>
                                </div>
                                <input type="radio" class="hidden" v-model="small_renovate_type" value="planning"><p class="inline-block text-base font-semibold leading-none">Andra typer</p>
                                <p class="text-sm text-gray-600 font-medium">Ge exempel.</p>
                            </label>
                            <label class="relative block border-2 border-gray-300 hover:bg-blue-100 hover:border-blue-300 rounded mt-4 p-3" :class="{'bg-blue-100 border-blue-500': small_renovate_type == 'shed'}">
                                <div class="absolute right-0 top-0 p-3" :class="{'hidden': small_renovate_type != 'shed'}">
                                    <div class="rounded-full bg-blue-200 h-6 w-6 flex items-center justify-center inline">
                                        <i class="fas fa-check text-blue-800 fa-sm"></i>
                                    </div>
                                </div>
                                <input type="radio" class="hidden" v-model="small_renovate_type" value="shed"><p class="inline-block text-base font-semibold leading-none">Specialfall</p>
                                <p class="text-sm text-gray-600 font-medium">Ge exempel</p>
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
          build_type: null,
          build_new_type: null,
          expand_type: null,
          renovate_type: null,
          extensive_renovate_type: null,
          small_renovate_type: null
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
