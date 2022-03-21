Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1574E2F76
	for <lists+greybus-dev@lfdr.de>; Mon, 21 Mar 2022 18:57:23 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C12EE3EF98
	for <lists+greybus-dev@lfdr.de>; Mon, 21 Mar 2022 17:57:22 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	by lists.linaro.org (Postfix) with ESMTPS id C24AB3EE13
	for <greybus-dev@lists.linaro.org>; Mon, 21 Mar 2022 17:57:20 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id A5F435C01F4;
	Mon, 21 Mar 2022 13:57:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 21 Mar 2022 13:57:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
	 h=cc:cc:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; bh=aEi7KLrn80AT8Z4xevfDc/sY1gpnHc
	KEaIStPTWHr1Q=; b=xHoiwLegu8EvXObyvRyTh15zpU6LVHDhw+5R9ifSGq4zsV
	C2u4FECtnUcT5KkZG1AyPCf/Aw3wLLdwwilG/7y4YR6p6Du3nPiISZR+cwhz3uWo
	QUhofanU8bk9NQL8jpd1Af+kGb/vaMZSPwh/4AODTeDwZXM8SGRTY2maMwNOUrCl
	sgGXyNSDb3cLoXuQibzZxydXL4ftGoVGgOF0Vhdxqolve2Qfe0U1iVfbEEiEqv3e
	ovw7a3/pQYxc3Zz88oEt7bcVhjFZyCpBPQL2O6/V86NOjD1KPsgrSIMtQOYCBQb7
	Nvu0s+Z7oLJ6m6LNv0Wy+dDAgXOBkFd6bA2QTnaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=aEi7KLrn80AT8Z4xe
	vfDc/sY1gpnHcKEaIStPTWHr1Q=; b=P2Z9Q1irxHhGHZnHPhKE6n/4ZCTFV7jT2
	A2z5/02+7l0qG7owMTDy/zOCRil5h+OyOWaqrfqu7FA3+TzgdVlS2S/uMgHP/nez
	yJC/AivQgvtuS3IVb3M1F5EleAv6WiKO6Dc9dWGSQzSHtHWn/n79smNNiXO4+wrm
	8FApKhJjOqgPG9NZZR2XOLlN/gWZx3qkV3SX2Ccvk726kxQ0NB9cCboPrdlFKoq5
	KnNheVmSuw5eOIed1PjDtwT1oiPspdGTpSLA1RgwhmAK+dt+NUeM0iqzS4QEvg71
	+2Fmw7jDrmVhfy7FIByYGcfimaMkpETcRk8KzF3l9SeKBsqwOHnkA==
X-ME-Sender: <xms:gLw4YtBVUwuwpbbahHEgAiP7kVruuU0Z6twMXK2f2ingwb8G-ArJbw>
    <xme:gLw4YriFSnXAxDSIxZQ6Bm8SAOm8rqmQ1045bjcTLcH0PGTuH_7pT_EY9uH_8vqG8
    6Z1s7WAhDmLsjWT4A>
X-ME-Received: <xmr:gLw4YomX3rHNBAfFy71FPsg-O_Zt6F63ehH_fiXZRHViwNjyg2veaTSx9fjvWDS7lEtwYWELHQ1zumnBUQwdMGCpzhsTKJWTBPYA-uk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudegfedguddtkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujghosehttdertddttddvnecuhfhrohhmpeforghr
    khcuifhrvggvrhcuoehmghhrvggvrhesrghnihhmrghltghrvggvkhdrtghomheqnecugg
    ftrfgrthhtvghrnhepudejleegjeelgeelveekkedvveduhfetueeitdelhedtudelledv
    ieffhfdvhedtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmghhrvggvrhesrghnihhmrghl
    tghrvggvkhdrtghomh
X-ME-Proxy: <xmx:gLw4YnwHG31Q-UoD60J488kSnZ7ujjr_620rTR008teVJm-HL5Rk7Q>
    <xmx:gLw4YiRczzcI0QV0Noa0r2TplPMy0fJ-XxrZDsbmvHtV7SqC8v4jeA>
    <xmx:gLw4YqYvKborsUh7wP5mngXhc8S6DSqnMBCjAf5QPe5Y2EcYkn6LIg>
    <xmx:gLw4YuZ3oqxWbXoNwx98fKKfBS33EoE5Wauq3qrDvyQ4FIN1RyY8ww>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Mar 2022 13:57:20 -0400 (EDT)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
	id 8C12B136015B; Mon, 21 Mar 2022 10:57:19 -0700 (MST)
Date: Mon, 21 Mar 2022 10:57:19 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: Jakob Koschel <jakobkoschel@gmail.com>
Message-ID: <20220321175719.GB647493@animalcreek.com>
References: <20220321123712.3068778-1-jakobkoschel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220321123712.3068778-1-jakobkoschel@gmail.com>
Organization: Animal Creek Technologies, Inc.
Message-ID-Hash: AESDK7ELGSPSQIJ7MVZJNSGI4YMM6QVK
X-Message-ID-Hash: AESDK7ELGSPSQIJ7MVZJNSGI4YMM6QVK
X-MailFrom: mgreer@animalcreek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Mike Rapoport <rppt@kernel.org>, Brian Johannesmeyer <bjohannesmeyer@gmail.com>, Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: codecs: use dedicated list iterator variable
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/AESDK7ELGSPSQIJ7MVZJNSGI4YMM6QVK/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 21, 2022 at 01:37:12PM +0100, Jakob Koschel wrote:
> In preparation to limit the scope of the list iterator to the list
> traversal loop, use a dedicated pointer to point to the found element [1].
> 
> Link: https://lore.kernel.org/all/YhdfEIwI4EdtHdym@kroah.com/
> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
> ---
>  drivers/staging/greybus/audio_codec.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
> index b589cf6b1d03..a446d6455fbd 100644
> --- a/drivers/staging/greybus/audio_codec.c
> +++ b/drivers/staging/greybus/audio_codec.c
> @@ -497,7 +497,7 @@ static int gbcodec_prepare(struct snd_pcm_substream *substream,
>  			   struct snd_soc_dai *dai)
>  {
>  	int ret;
> -	struct gbaudio_module_info *module;
> +	struct gbaudio_module_info *module = NULL, *iter;
>  	struct gbaudio_data_connection *data;
>  	struct gb_bundle *bundle;
>  	struct gbaudio_codec_info *codec = dev_get_drvdata(dai->dev);
> @@ -511,11 +511,13 @@ static int gbcodec_prepare(struct snd_pcm_substream *substream,
>  		return -ENODEV;
>  	}
>  
> -	list_for_each_entry(module, &codec->module_list, list) {
> +	list_for_each_entry(iter, &codec->module_list, list) {
>  		/* find the dai */
> -		data = find_data(module, dai->id);
> -		if (data)
> +		data = find_data(iter, dai->id);
> +		if (data) {
> +			module = iter;
>  			break;
> +		}
>  	}
>  	if (!data) {
>  		dev_err(dai->dev, "DATA connection missing\n");
> @@ -563,7 +565,7 @@ static int gbcodec_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
>  {
>  	int ret;
>  	struct gbaudio_data_connection *data;
> -	struct gbaudio_module_info *module;
> +	struct gbaudio_module_info *module = NULL, *iter;
>  	struct gb_bundle *bundle;
>  	struct gbaudio_codec_info *codec = dev_get_drvdata(dai->dev);
>  	struct gbaudio_stream_params *params;
> @@ -592,11 +594,13 @@ static int gbcodec_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
>  		return ret;
>  	}
>  
> -	list_for_each_entry(module, &codec->module_list, list) {
> +	list_for_each_entry(iter, &codec->module_list, list) {
>  		/* find the dai */
> -		data = find_data(module, dai->id);
> -		if (data)
> +		data = find_data(iter, dai->id);
> +		if (data) {
> +			module = iter;
>  			break;
> +		}
>  	}
>  	if (!data) {
>  		dev_err(dai->dev, "%s:%s DATA connection missing\n",
> 
> base-commit: f443e374ae131c168a065ea1748feac6b2e76613

Reviewed-by: Mark Greer <mgreer@animalcreek.com>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
