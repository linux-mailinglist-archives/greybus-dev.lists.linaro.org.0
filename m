Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DDA6BEB52
	for <lists+greybus-dev@lfdr.de>; Fri, 17 Mar 2023 15:32:32 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 967943F52D
	for <lists+greybus-dev@lfdr.de>; Fri, 17 Mar 2023 14:32:31 +0000 (UTC)
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	by lists.linaro.org (Postfix) with ESMTPS id 4B4513F49A
	for <greybus-dev@lists.linaro.org>; Fri, 17 Mar 2023 14:32:26 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=inria.fr header.s=dc header.b=e90ijvQJ;
	spf=pass (lists.linaro.org: domain of julia.lawall@inria.fr designates 192.134.164.104 as permitted sender) smtp.mailfrom=julia.lawall@inria.fr;
	dmarc=pass (policy=none) header.from=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=qd2c1F/RKdoyuacgKR4OV54q/5MbNHgOuA8VsG4BQkA=;
  b=e90ijvQJeI9BvI7viY2cIsQHfTiu49w87bUT4mETpphBKqq5ykqQ2zjl
   QnzeXla93Qhk+2LVDmtjaob3emxmCVqLKt0M6ZEYDW4eMEVTjbYJ/njsh
   o/B74bFAJNKiU3eeUqG/jV1uzSnmuLAIpmOG4Yy/hZq90jETe/cpE0wHM
   w=;
X-IronPort-AV: E=Sophos;i="5.98,268,1673910000";
   d="scan'208";a="50508195"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 15:32:24 +0100
Date: Fri, 17 Mar 2023 15:32:24 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Mark Thomas Heim <questioneight@gmail.com>
In-Reply-To: <20230317141756.GA43753@pikachu-Z97-D3H>
Message-ID: <5f036ea-4a8c-54ee-5eaa-4ee1aac0472c@inria.fr>
References: <20230317141756.GA43753@pikachu-Z97-D3H>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 4B4513F49A
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[inria.fr,none];
	R_SPF_ALLOW(-0.20)[+ip4:192.134.164.0/24];
	R_DKIM_ALLOW(-0.20)[inria.fr:s=dc];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[192.134.164.104:from];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,animalcreek.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	ASN(0.00)[asn:2200, ipnet:192.134.164.0/24, country:FR];
	NEURAL_HAM(-0.00)[-0.898];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[inria.fr:+];
	URIBL_BLOCKED(0.00)[mail3-relais-sop.national.inria.fr:rdns,mail3-relais-sop.national.inria.fr:helo];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2]
Message-ID-Hash: RVL7GU74H7W5ZCSDTF7WJR4EXIKCCRKI
X-Message-ID-Hash: RVL7GU74H7W5ZCSDTF7WJR4EXIKCCRKI
X-MailFrom: julia.lawall@inria.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: extract a fxn to improve clarity
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/RVL7GU74H7W5ZCSDTF7WJR4EXIKCCRKI/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Fri, 17 Mar 2023, Mark Thomas Heim wrote:

> The gb_audio_gb_get_topology function at the top of the file
> needs to be split per a TODO comment above the function. It
> is necessary to refactor the code to pull out a method
> that has fewer parameters to improve readability. A
> prototype for the new function is now in the relevant header,
> and the simpler function calls replace the old ones.

Mark,

Please go back and read the outreachy tutorial, in particular

https://kernelnewbies.org/PatchPhilosophy

The commit message is not written in the imperative, as it is required to
be.

Also, words like "needs to" and "necessary" express an opinion.  These
things may indeed be good things to do, but "needs to" and "necessary"
don't help to understand why the change is being made.

julia

>
> Signed-off-by: Mark Thomas Heim <questioneight@gmail.com>
> ---
>  drivers/staging/greybus/audio_codec.h |  2 ++
>  drivers/staging/greybus/audio_gb.c    | 21 +++++++++++----------
>  2 files changed, 13 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/staging/greybus/audio_codec.h b/drivers/staging/greybus/audio_codec.h
> index ce15e800e607..a2e8361952b8 100644
> --- a/drivers/staging/greybus/audio_codec.h
> +++ b/drivers/staging/greybus/audio_codec.h
> @@ -177,6 +177,8 @@ int gbaudio_register_module(struct gbaudio_module_info *module);
>  void gbaudio_unregister_module(struct gbaudio_module_info *module);
>
>  /* protocol related */
> +int fetch_gb_audio_data(struct gb_connection *connection, int type,
> +			void *response, int response_size);
>  int gb_audio_gb_get_topology(struct gb_connection *connection,
>  			     struct gb_audio_topology **topology);
>  int gb_audio_gb_get_control(struct gb_connection *connection,
> diff --git a/drivers/staging/greybus/audio_gb.c b/drivers/staging/greybus/audio_gb.c
> index 9d8994fdb41a..3c924d13f0e7 100644
> --- a/drivers/staging/greybus/audio_gb.c
> +++ b/drivers/staging/greybus/audio_gb.c
> @@ -8,7 +8,13 @@
>  #include <linux/greybus.h>
>  #include "audio_codec.h"
>
> -/* TODO: Split into separate calls */
> +int fetch_gb_audio_data(struct gb_connection *connection,
> +			int type, void *response, int response_size)
> +{
> +	return gb_operation_sync(connection, type, NULL, 0,
> +				 response, response_size);
> +}
> +
>  int gb_audio_gb_get_topology(struct gb_connection *connection,
>  			     struct gb_audio_topology **topology)
>  {
> @@ -17,28 +23,23 @@ int gb_audio_gb_get_topology(struct gb_connection *connection,
>  	u16 size;
>  	int ret;
>
> -	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE,
> -				NULL, 0, &size_resp, sizeof(size_resp));
> +	ret = fetch_gb_audio_data(connection, GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE,
> +				  &size_resp, sizeof(size_resp));
>  	if (ret)
>  		return ret;
> -
>  	size = le16_to_cpu(size_resp.size);
>  	if (size < sizeof(*topo))
>  		return -ENODATA;
> -
>  	topo = kzalloc(size, GFP_KERNEL);
>  	if (!topo)
>  		return -ENOMEM;
> -
> -	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY, NULL, 0,
> -				topo, size);
> +	ret = fetch_gb_audio_data(connection, GB_AUDIO_TYPE_GET_TOPOLOGY,
> +				  topo, size);
>  	if (ret) {
>  		kfree(topo);
>  		return ret;
>  	}
> -
>  	*topology = topo;
> -
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(gb_audio_gb_get_topology);
> --
> 2.25.1
>
>
>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
