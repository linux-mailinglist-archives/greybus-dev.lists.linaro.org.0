Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCFD4E2F73
	for <lists+greybus-dev@lfdr.de>; Mon, 21 Mar 2022 18:56:59 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7F8693EF9A
	for <lists+greybus-dev@lfdr.de>; Mon, 21 Mar 2022 17:56:58 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	by lists.linaro.org (Postfix) with ESMTPS id DC9903EE13
	for <greybus-dev@lists.linaro.org>; Mon, 21 Mar 2022 17:56:55 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id AA8425C020D;
	Mon, 21 Mar 2022 13:56:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 21 Mar 2022 13:56:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
	 h=cc:cc:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; bh=xR2HymObUcHW2Ru/WNztu5+8qpLOJK
	0OIKxqaZHFhPE=; b=D/75QaV9d16KtYAFSmM89OelNNcnvivOmvJkcA0LaTGlFO
	zGPpIfH6qRwdn9+DDsgl6mrBA3wDrXUST68EfcqQOCBCvUWCSQdj9KmH5m+NDIwx
	OgoKWoGnr1xiLlp4lCtQojdVPcTW/qoy8edYGPnLcu57KQPOIGlSh+UFYXeLsGIp
	vg8cOVMWfWemxWavDcUf9dN0oRfyQn8BTdvs1k9ATWxf1Obd2rItPcDN5FYRjrbE
	EJB7BJtDvojhSLALDFhx4P9XK+LXeRqUlko5ARGTlwFirBlastiFVPwddVLs+I2f
	hLPLiGIJ7/1s2ylnb6ersKSfKgxED037uKDWZadw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=xR2HymObUcHW2Ru/W
	Nztu5+8qpLOJK0OIKxqaZHFhPE=; b=bB6oMib+z5i4JY5nLvEuQoJILWqyGdON9
	a2kkKpHrm/KHubawEmUu7Qz7zOtheVGeaNLC+GEP8Jn9x2kxPHMR640sPndtHR1W
	334h86tHNXDrKMO8P11+iMjm/XPsz7N2DUtZYvzm0fY2VqQupls0giVqOmCik8q8
	R3B9uKgOKTvf+gwbS+FDbJttH/e3/QSGoVmniYbdzZeF3KD92RaItvvIvRe34xpq
	b00aF3r3+cx6jOFFYkpQqqgntWlhOPqnY5P19cRFpNF/DjLDI0FIrzHxhhcm10rj
	TrItycGG6k0CzUGdUYOOauk+e6TGJbeUIsq9gmcoAo1iWVPDdTDuw==
X-ME-Sender: <xms:Z7w4YkKRMRdJN7Bl_Es1hyZFmR17GDLLpsDEzVh4cJgjpXrvbv1Lvg>
    <xme:Z7w4YkJBatUBN2ePYgHu5qm8kxo-dv8XHYLiSw-slSwkCp3RRcj4f01Nv_7NkTI8f
    oQfY1QcQrHbkhoedA>
X-ME-Received: <xmr:Z7w4YkttF7Hk0ivRieFIXb1uBqtkhu3bDl1cqDfUz0UVlA2MNzRN16nYO3RxBDvGy59bpNT9JWgSNUUEutqA8MMrAb2HOcEUwk_gG2s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudegfedguddtkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujghosehttdertddttddvnecuhfhrohhmpeforghr
    khcuifhrvggvrhcuoehmghhrvggvrhesrghnihhmrghltghrvggvkhdrtghomheqnecugg
    ftrfgrthhtvghrnhepieeugfdutdefiedtvdfftedufedvjeehgfevveefudfgjeffgeei
    teetjedufffhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepmhhgrhgvvghrsegrnhhimhgrlhgtrhgvvghkrdgtohhm
X-ME-Proxy: <xmx:Z7w4YhZXMoPjvKN7Q-hPKRi54NBuv_DJh8FhHNC_oSevXzcKeSaGOA>
    <xmx:Z7w4YracOK-PUOyLON2PgC7TSyu_vFGP-5M6Tphvlpb9nn62fvdFig>
    <xmx:Z7w4YtDZlERtbfssYwDLI46kgQ7f4qmhTyCYZ9yij7nekP05DvD7Kg>
    <xmx:Z7w4YpAAVYS7Hv9WS0HfUlpsbbvJQHP0jDCBNMs5polh_w0Ot_rdTg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Mar 2022 13:56:55 -0400 (EDT)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
	id 1F3AF136015B; Mon, 21 Mar 2022 10:56:54 -0700 (MST)
Date: Mon, 21 Mar 2022 10:56:54 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: Jakob Koschel <jakobkoschel@gmail.com>
Message-ID: <20220321175654.GA647493@animalcreek.com>
References: <20220321123626.3068639-1-jakobkoschel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220321123626.3068639-1-jakobkoschel@gmail.com>
Organization: Animal Creek Technologies, Inc.
Message-ID-Hash: 5GWN4OOAE3TAXJ5KYRUS52RM3NQYCKUR
X-Message-ID-Hash: 5GWN4OOAE3TAXJ5KYRUS52RM3NQYCKUR
X-MailFrom: mgreer@animalcreek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Mike Rapoport <rppt@kernel.org>, Brian Johannesmeyer <bjohannesmeyer@gmail.com>, Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: codecs: fix type confusion of list iterator variable
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5GWN4OOAE3TAXJ5KYRUS52RM3NQYCKUR/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 21, 2022 at 01:36:26PM +0100, Jakob Koschel wrote:
> If the list does not exit early then data == NULL and 'module' does not
> point to a valid list element.
> Using 'module' in such a case is not valid and was therefore removed.
> 
> Fixes: 6dd67645f22c ("greybus: audio: Use single codec driver registration")
> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
> ---
>  drivers/staging/greybus/audio_codec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
> index b589cf6b1d03..e19b91e7a72e 100644
> --- a/drivers/staging/greybus/audio_codec.c
> +++ b/drivers/staging/greybus/audio_codec.c
> @@ -599,8 +599,8 @@ static int gbcodec_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
>  			break;
>  	}
>  	if (!data) {
> -		dev_err(dai->dev, "%s:%s DATA connection missing\n",
> -			dai->name, module->name);
> +		dev_err(dai->dev, "%s DATA connection missing\n",
> +			dai->name);
>  		mutex_unlock(&codec->lock);
>  		return -ENODEV;
>  	}
> 
> base-commit: f443e374ae131c168a065ea1748feac6b2e76613

Reviewed-by: Mark Greer <mgreer@animalcreek.com>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
