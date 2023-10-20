Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1F27D05B4
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Oct 2023 02:15:49 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5894E40C46
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Oct 2023 00:15:48 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	by lists.linaro.org (Postfix) with ESMTPS id F1FDA3F967
	for <greybus-dev@lists.linaro.org>; Fri, 20 Oct 2023 00:15:39 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=fNEMSmTz;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.166.174 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3574f99d260so906725ab.3
        for <greybus-dev@lists.linaro.org>; Thu, 19 Oct 2023 17:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1697760939; x=1698365739; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mavY78H1YWmzBveT0yeZCxcrcnmsQliTa1UnMt+0QL8=;
        b=fNEMSmTzoW5SPR7VeXxYKPsngB4/d6gSXepN4OrvhyhCbOqKyRE3k6Izx7fTYdZukI
         AFkD1Ow3Q0zLOmHELkVvmoQwkZBhQAGY3IplA3TJdy49Ku+Fs0raMQhdmj7vllr63wME
         KZz0I9ERnpajMaEhqW4dLNNr/KHisWYcbUj2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697760939; x=1698365739;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mavY78H1YWmzBveT0yeZCxcrcnmsQliTa1UnMt+0QL8=;
        b=WnM5PYv1gYmvcezCh2CuCGcTzS2WrbiI96Qjm/yRajnjJX9fhqw44Sdyc6MFVcgS1v
         eciIh7uyeOGZR154QjZwOaUOwRvwCYCpp5oFefKeO/rXyV94Gvi1xL2RKYITv5Sysk4+
         80hlL2jstyVScxccEbsSkHWVjQyDrd9WwkbU62ILMMutA8UqYw70N8h//w6bzUim2hew
         zEqJAE9YFIyCmoShofMPILHagzCDQ5OdzBdC05GdWx1eT8whCsugge4wWrWCR4NnR3tG
         CknEKdOuNSIRBJeDW90ACQDftlXHv9clHvDYyySmqi9hN5Y4QvD4mkMIXcQawhkD/wiH
         M6yg==
X-Gm-Message-State: AOJu0YzICGgbzNwQvXmLzi0g1KmYLE8TRsNvO51dKBVUkpyEsGbEuAFx
	o4ZvQmLk4oy8bmtHMEqasKlWuQ==
X-Google-Smtp-Source: AGHT+IFTT8bntjPNn9KbYkuJLNM8Jou66TfYltHPkHiegMie47QbNKhG+fplwP3pmZrXUi1Ab1wcZw==
X-Received: by 2002:a92:c262:0:b0:351:19a4:8e67 with SMTP id h2-20020a92c262000000b0035119a48e67mr608835ild.28.1697760939322;
        Thu, 19 Oct 2023 17:15:39 -0700 (PDT)
Received: from [10.211.55.3] (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id 2-20020a056e0220c200b003512c3e8809sm226274ilq.71.2023.10.19.17.15.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Oct 2023 17:15:38 -0700 (PDT)
Message-ID: <e24e41be-b2c4-4bda-8a34-a628c55c4061@ieee.org>
Date: Thu, 19 Oct 2023 19:15:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20231019213949.GA2922@ubuntu>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20231019213949.GA2922@ubuntu>
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.49 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	DKIM_TRACE(0.00)[ieee.org:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.166.174:from];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[];
	BLOCKLISTDE_FAIL(0.00)[98.61.227.136:server fail,209.85.166.174:server fail];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: F1FDA3F967
Message-ID-Hash: GFMLNV36QLDQTBJSV3ASZK4CZNHICE4L
X-Message-ID-Hash: GFMLNV36QLDQTBJSV3ASZK4CZNHICE4L
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Alignment should match open parenthesis
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/GFMLNV36QLDQTBJSV3ASZK4CZNHICE4L/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 10/19/23 4:39 PM, Nandha Kumar Singaram wrote:
> Adhere to linux coding style. Reported by checkpatch.pl:
> CHECK: Alignment should match open parenthesis

Sometimes checkpatch.pl warns about things that are not
really that important.  One class of this type of issue
is white space errors.

Yes, consistency is good, but the kernel simply doesn't
have universally consistent conventions, and I doubt
it ever will.  There might be times where a source file
consistently follows a white space convention that
differs from what checkpatch wants.  Suggesting a
wholesale change to that file to "fix" that typically
wouldn't be welcome.

Unfortunately without some experience it's hard to know
which checkpatch warnings can be safely ignored.  I would
place white space warnings at a lower priority for fixing
than some others.  For example, this is also a pretty
trivial warning:
   CHECK: Macro argument 'gcam' may be better as '(gcam)' to avoid 
precedence issues
And it is most likely not a problem in this case, but fixing
this type of warning is probably more constructive than
just adjusting white space.

I have no objection to your patch, and it's a fine way to
get some experience with the patch process, but I don't
think this particular change is necessary.

					-Alex

> Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
> ---
>   drivers/staging/greybus/camera.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> index cdbb42cd413b..405c8e78aa72 100644
> --- a/drivers/staging/greybus/camera.c
> +++ b/drivers/staging/greybus/camera.c
> @@ -220,7 +220,7 @@ static int gb_camera_operation_sync_flags(struct gb_connection *connection,
>   }
>   
>   static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
> -		struct gb_camera_configure_streams_response *resp)
> +				      struct gb_camera_configure_streams_response *resp)
>   {
>   	unsigned int max_pkt_size = 0;
>   	unsigned int i;
> @@ -267,8 +267,7 @@ static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
>    * Validate the stream configuration response verifying padding is correctly
>    * set and the returned number of streams is supported
>    */
> -static const int gb_camera_configure_streams_validate_response(
> -		struct gb_camera *gcam,
> +static const int gb_camera_configure_streams_validate_response(struct gb_camera *gcam,
>   		struct gb_camera_configure_streams_response *resp,
>   		unsigned int nstreams)
>   {
> @@ -378,8 +377,8 @@ struct ap_csi_config_request {
>   #define GB_CAMERA_CSI_CLK_FREQ_MARGIN		150000000U
>   
>   static int gb_camera_setup_data_connection(struct gb_camera *gcam,
> -		struct gb_camera_configure_streams_response *resp,
> -		struct gb_camera_csi_params *csi_params)
> +					   struct gb_camera_configure_streams_response *resp,
> +					   struct gb_camera_csi_params *csi_params)
>   {
>   	struct ap_csi_config_request csi_cfg;
>   	struct gb_connection *conn;
> @@ -783,8 +782,9 @@ static ssize_t gb_camera_op_capabilities(void *priv, char *data, size_t len)
>   }
>   
>   static int gb_camera_op_configure_streams(void *priv, unsigned int *nstreams,
> -		unsigned int *flags, struct gb_camera_stream *streams,
> -		struct gb_camera_csi_params *csi_params)
> +					  unsigned int *flags,
> +					  struct gb_camera_stream *streams,
> +					  struct gb_camera_csi_params *csi_params)
>   {
>   	struct gb_camera *gcam = priv;
>   	struct gb_camera_stream_config *gb_streams;

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
