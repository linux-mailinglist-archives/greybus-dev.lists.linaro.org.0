Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC708592EE
	for <lists+greybus-dev@lfdr.de>; Sat, 17 Feb 2024 22:19:10 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 13DFD44720
	for <lists+greybus-dev@lfdr.de>; Sat, 17 Feb 2024 21:19:09 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	by lists.linaro.org (Postfix) with ESMTPS id 53A9444714
	for <greybus-dev@lists.linaro.org>; Sat, 17 Feb 2024 21:19:02 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=B8Zpcc0G;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.222.175 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7875adf71b1so25395285a.0
        for <greybus-dev@lists.linaro.org>; Sat, 17 Feb 2024 13:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1708204742; x=1708809542; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jsUAb6vb40+XemerMiSmb6ZuxYzXcwGlQ49c+yrXOkw=;
        b=B8Zpcc0Ga5CSyrdVI5jMBvNuEsOLPXGeDow2Jm1selPygjAyOCsQ6lXJOGqPafv26R
         0IURNPDTBELfcCJozaN46v6QtINayzNsa6yrCb9xZeoAARZh8iP0WRwHOZEfonKDgdRd
         NCUzdg2gzGXNZlHPUs0kyLDPujLXZs83xgGDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708204742; x=1708809542;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jsUAb6vb40+XemerMiSmb6ZuxYzXcwGlQ49c+yrXOkw=;
        b=j0Sfc1NV3SLabCP0SglwMrCBp6LYwq2UUpzv4A87fqzrmNZS+hXC32y8pQmGYrfyxf
         81yq0dO7kd8lVG3Lg4Zlnj2tbBWat0+55VTVvJaZZ1eurpZI7e9j0llF8ryspQlc4anb
         3vPH+UzPIVaLO2EthCJQj5HpbE6mPCjEuaOwCusZX2A3y2wNh9Sv5j+IYYAZqOGwuK4y
         ZrsFk7Jn5RDe7W3gf3Lfpji1gdBSZLT7F+2sn2NgEvqjrJpxOmfAb3jyc+Rg/RJhCxR9
         uKxbnAAP+J5hadLcfWHltP/EDM0OFhMfLznhZq+FiPqExBkk0+ieGPjP1kojlACwNyDK
         tZ8g==
X-Gm-Message-State: AOJu0Yz9swpgrzwiCYwkwBChNMR9xqS13VJRVGIPh9aeaaYF08I6AHpQ
	zOFBWHiaq5SzBrYZJCc9ZCtotyzBje/knoaLxp3zuidaeza8ryWIBYaW5JtfLg==
X-Google-Smtp-Source: AGHT+IGP14v6oCCtMP0+vugRbMd2i51vK0hqWp5NBXjAY0xKJajqQMGwjum2Jn2GI6G56nWQ9lc40Q==
X-Received: by 2002:a05:620a:46ab:b0:787:538c:58cb with SMTP id bq43-20020a05620a46ab00b00787538c58cbmr4663545qkb.28.1708204741830;
        Sat, 17 Feb 2024 13:19:01 -0800 (PST)
Received: from [10.211.55.3] (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id c3-20020a05620a11a300b00785d7f634bcsm1116200qkk.8.2024.02.17.13.19.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Feb 2024 13:19:01 -0800 (PST)
Message-ID: <02cf87a3-4e92-4f6d-98f6-dfc0e198d462@ieee.org>
Date: Sat, 17 Feb 2024 15:18:59 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Erick Archer <erick.archer@gmx.com>,
 Vaibhav Agarwal <vaibhav.sr@gmail.com>, Mark Greer <mgreer@animalcreek.com>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Kees Cook <keescook@chromium.org>
References: <20240217154758.7965-1-erick.archer@gmx.com>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20240217154758.7965-1-erick.archer@gmx.com>
X-Rspamd-Queue-Id: 53A9444714
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.49 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.222.175:from];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmx.com,gmail.com,animalcreek.com,kernel.org,linuxfoundation.org,chromium.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ieee.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: ZMXEBEJ3A5NTLPVWYDRVP7XWR5EK63YJ
X-Message-ID-Hash: ZMXEBEJ3A5NTLPVWYDRVP7XWR5EK63YJ
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: audio: apbridgea: Remove flexible array from struct audio_apbridgea_hdr
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZMXEBEJ3A5NTLPVWYDRVP7XWR5EK63YJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 2/17/24 9:47 AM, Erick Archer wrote:
> When a struct containing a flexible array is included in another struct,
> and there is a member after the struct-with-flex-array, there is a
> possibility of memory overlap. These cases must be audited [1]. See:
> 
> struct inner {
> 	...
> 	int flex[];
> };
> 
> struct outer {
> 	...
> 	struct inner header;
> 	int overlap;
> 	...
> };
> 
> This is the scenario for the "struct audio_apbridgea_hdr" structure
> that is included in the following "struct audio_apbridgea_*_request"
> structures:

Yeah this was not a very good way to define these header
structures, but I'm glad to hear the flexible array at the
end was never used.  I don't know why it was there; maybe
it's an artifact from some other information that got removed.

If the code compiles with your change, it ought to be fine.
(It compiles for me.)

It would be good for Vaibhav or Mark to comment though, maybe
they can provide some context.


> 
> struct audio_apbridgea_set_config_request
> struct audio_apbridgea_register_cport_request
> struct audio_apbridgea_unregister_cport_request
> struct audio_apbridgea_set_tx_data_size_request
> struct audio_apbridgea_prepare_tx_request
> struct audio_apbridgea_start_tx_request
> struct audio_apbridgea_stop_tx_request
> struct audio_apbridgea_shutdown_tx_request
> struct audio_apbridgea_set_rx_data_size_request
> struct audio_apbridgea_prepare_rx_request
> struct audio_apbridgea_start_rx_request
> struct audio_apbridgea_stop_rx_request
> struct audio_apbridgea_shutdown_rx_request
> 
> The pattern is like the one shown below:
> 
> struct audio_apbridgea_hdr {
> 	...
> 	__u8 data[];
> } __packed;
> 
> struct audio_apbridgea_*_request {
> 	struct audio_apbridgea_hdr hdr;
> 	...
> } __packed;
> 
> In this case, the trailing flexible array can be removed because it is
> never used.
> 
> Link: https://github.com/KSPP/linux/issues/202 [1]
> Signed-off-by: Erick Archer <erick.archer@gmx.com>
> ---
> Hi everyone,
> 
> I'm not sure this patch is correct. My concerns are:
> 
> The "struct audio_apbridgea_hdr" structure is used as a first member in
> all the "struct audio_apbridgea_*_request" structures. And these last
> structures are used in the "gb_audio_apbridgea_*(...)" functions. These
> functions fill the "request" structure and always use:
> 
> 	gb_hd_output(connection->hd, &req, sizeof(req),
> 		     GB_APB_REQUEST_AUDIO_CONTROL, true);
> 
> Then, the "gb_hd_output(struct gb_host_device *hd, ...)" function calls:
> 
> 	hd->driver->output(hd, req, size, cmd, async);
> 
> The first parameter to this function is of type:
> 
> 	struct gb_host_device {
> 		...
> 		const struct gb_hd_driver *driver;
> 		...
> 	};
> 
> And the "gb_hd_driver" structure is defined as:
> 
> 	struct gb_hd_driver {
> 		...
> 		int (*output)(struct gb_host_device *hd, void *req, u16 size, u8 cmd,
> 			      bool async);
> 	};
> 
> Therefore, my question is:
> Where is the "output" function pointer set? I think I'm missing something.

I think it will be drivers/greybus/es2.c:output().

But in any case, the output function will know nothing about
the structure of the request, so I think it's unrelated to
the change you're proposing.

Johan can confirm this.

I'd like to hear from these others, but otherwise this change
looks good to me.

Reviewed-by: Alex Elder <elder@linaro.org>

> 
> I have search for another greybus drivers and I have found that, for
> example, the "es2_ap_driver" (drivers/greybus/es2.c) sets the "output"
> member in:
> 
> 	static struct gb_hd_driver es2_driver = {
> 		...
> 		.output	= output,
> 	};
> 
> I think that the flexible array that I have removed should be used in
> the function assigned to the "output" function pointer. But I am not
> able to find this function.
> 
> A bit of light on this would be greatly appreciated.
> 
> Thanks,
> Erick
> ---
>   drivers/staging/greybus/audio_apbridgea.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/audio_apbridgea.h b/drivers/staging/greybus/audio_apbridgea.h
> index efec0f815efd..ab707d310129 100644
> --- a/drivers/staging/greybus/audio_apbridgea.h
> +++ b/drivers/staging/greybus/audio_apbridgea.h
> @@ -65,7 +65,6 @@
>   struct audio_apbridgea_hdr {
>   	__u8	type;
>   	__le16	i2s_port;
> -	__u8	data[];
>   } __packed;
> 
>   struct audio_apbridgea_set_config_request {
> --
> 2.25.1
> 

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
