<script lang="ts">
	import { getContext } from 'svelte';
	import { fade } from 'svelte/transition';
	import Scale from '$lib/components/icons/Scale.svelte';
	import DocumentPage from '$lib/components/icons/DocumentPage.svelte';
	import Plus from '$lib/components/icons/Plus.svelte';

	const i18n = getContext('i18n');

	export let onAction = (action: string) => {};
</script>

<div class="w-full max-w-4xl mx-auto p-4" in:fade={{ duration: 200 }}>
	<!-- Status Panel -->
	<div class="grid grid-cols-2 md:grid-cols-4 gap-4 mb-8 text-xs font-mono text-gray-400">
		<div class="border border-gray-800 p-2 text-center uppercase tracking-widest">
			<span class="block text-gray-600 mb-1">System</span>
			<span class="text-green-500">Air-Gapped</span>
		</div>
		<div class="border border-gray-800 p-2 text-center uppercase tracking-widest">
			<span class="block text-gray-600 mb-1">Encryption</span>
			<span class="text-white">AES-256</span>
		</div>
		<div class="border border-gray-800 p-2 text-center uppercase tracking-widest">
			<span class="block text-gray-600 mb-1">Network</span>
			<span class="text-white">Localhost</span>
		</div>
		<div class="border border-gray-800 p-2 text-center uppercase tracking-widest">
			<span class="block text-gray-600 mb-1">Status</span>
			<span class="text-green-500">Operational</span>
		</div>
	</div>

	<!-- Title -->
	<div class="text-center mb-12">
		<h1 class="text-4xl md:text-5xl font-bold text-white mb-2 tracking-tight">ARG-LEX</h1>
		<div class="text-gray-500 uppercase tracking-[0.2em] text-sm">Command Center</div>
	</div>

	<!-- Quick Actions Grid -->
	<div class="grid grid-cols-1 md:grid-cols-3 gap-6 font-primary">
		<button
			class="group relative border border-gray-800 bg-gray-900/50 hover:bg-gray-900 p-6 transition-all duration-200 text-left hover:border-gray-600"
			on:click={() => onAction('new_chat')}
		>
			<div class="absolute top-0 right-0 p-3 opacity-50 group-hover:opacity-100 transition-opacity">
				<Plus className="size-6 text-gray-400" />
			</div>
			<div class="mt-8">
				<div class="text-lg font-medium text-white mb-1">Nueva Causa</div>
				<div class="text-sm text-gray-500">Iniciar nueva sesión de investigación o análisis.</div>
			</div>
		</button>

		<button
			class="group relative border border-gray-800 bg-gray-900/50 hover:bg-gray-900 p-6 transition-all duration-200 text-left hover:border-gray-600"
			on:click={() => onAction('jurisprudence')}
		>
			<div class="absolute top-0 right-0 p-3 opacity-50 group-hover:opacity-100 transition-opacity">
				<Scale className="size-6 text-gray-400" />
			</div>
			<div class="mt-8">
				<div class="text-lg font-medium text-white mb-1">Jurisprudencia</div>
				<div class="text-sm text-gray-500">Búsqueda avanzada en base de datos de fallos.</div>
			</div>
		</button>

		<button
			class="group relative border border-gray-800 bg-gray-900/50 hover:bg-gray-900 p-6 transition-all duration-200 text-left hover:border-gray-600"
			on:click={() => onAction('drafting')}
		>
			<div class="absolute top-0 right-0 p-3 opacity-50 group-hover:opacity-100 transition-opacity">
				<DocumentPage className="size-6 text-gray-400" />
			</div>
			<div class="mt-8">
				<div class="text-lg font-medium text-white mb-1">Redacción</div>
				<div class="text-sm text-gray-500">Asistente de escritos y documentos legales.</div>
			</div>
		</button>
	</div>
</div>
