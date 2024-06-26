class_name Collection extends Object


enum FindMode {
	SingleIndex,
	MultipleIndex,
}


# Essa função é usada para cópia de dicionários.
static func shallow_copy(dict: Dictionary) -> Dictionary:
	return shallow_merge(dict, {})


# Essa função é usada para mesclagem entre dicionários.
static func shallow_merge(src_dict: Dictionary, dest_dict: Dictionary) -> Dictionary:
	for i in src_dict.keys():
		dest_dict[i] = src_dict[i]


	return dest_dict


# Percorre todos os indices de: data e retorna o seu respectivo identificador quando verdadeiro.
static func find(
	data: Array,
	where: String,
	search: Variant,
	mode: FindMode = FindMode.SingleIndex,
	like: bool = false) -> Array:
		var response := [] as Array

		if not data.size():
			return response


		for i in range(data.size() -1, -1, -1):
			if not where in data[i]:
				break

			if not like and not data[i].get(where) == search:
				continue

			if like and not data[i].get(where).contains(search):
				continue


			response.append(i)


			if mode == FindMode.SingleIndex:
				break


		return response


