Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 641387B695A
	for <lists+greybus-dev@lfdr.de>; Tue,  3 Oct 2023 14:48:03 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5AAB243C5B
	for <lists+greybus-dev@lfdr.de>; Tue,  3 Oct 2023 12:48:02 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	by lists.linaro.org (Postfix) with ESMTPS id 01BA13E9FC
	for <greybus-dev@lists.linaro.org>; Tue,  3 Oct 2023 12:47:55 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=Kk8HtWRV;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.215.169 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-577fb90bb76so463045a12.2
        for <greybus-dev@lists.linaro.org>; Tue, 03 Oct 2023 05:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696337274; x=1696942074; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vjl1Ep1JqHB2U/AgaW1DmtTzRpgVOsnx8TJ7GUMj9hQ=;
        b=Kk8HtWRVDwxEdld7jHsGBhlAnDcEttuR8dRS0ZXu/EkV7ANV3uQFIiTA6SZH7SajSD
         f8Lp61/WvObwFxZ0YouH7AfAePUQ9FEFcAeMaak3b6KmB6VVluMrvszA1JriNDCTjeCi
         uLxLUmRqGnaryN7xdiPa5URt2D1z5UPVB0W3V/IRq5ncHkAVVh4rN1dWzwOYZnH08z/Y
         Pu8BpEa9Pmt2z55E5jJUhDikF5deSfPRWXAgZvNBVMqZ9cuHWwWBnGFdX0jgGy93vOwV
         uWVdkmHSIOsXcJgWmDBaTHOxVg5Eu8CVocA0LU0agilUvsjeBkczIstAleKxr/SjUJeN
         uj0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696337274; x=1696942074;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vjl1Ep1JqHB2U/AgaW1DmtTzRpgVOsnx8TJ7GUMj9hQ=;
        b=jG9o/lOEGRe7wfjJpwgCN0a/AlUwj33VOTqqf3LLatn3rAsMzMDhxbJ8rscZ9sKO4f
         wPcgRh/GumJ5oAp3/9Mp+K7N2RiHKJP3aLF2qWbTahLn9w/D0GVs6XlwWp1qXl+fYb+c
         1IrgENfw198gNKO7qDVcZ8gKRXERXYKgUgYj1rZPF1xws3H0bz5Zw1P6Lc/q+AM/YNS0
         mLwO6MQtr1l6c23xck5UrrEssAXBIfw/2eJkAdCsp4uDuKHlT5R6INb01ywjhK6WJKyq
         bW/fAZUZfjEN8xV2i88OB+35kLafEr4gTLPXlxqVqpZd8daPl/73uVPk+OK/sLz1cRhv
         jk6Q==
X-Gm-Message-State: AOJu0Yy0E59ZoBVZ8uDauw0fGnZ1IZysP6br2WMIhWVn509QS4NhytPb
	BptExnvdXaH2dmPu4mCgTys=
X-Google-Smtp-Source: AGHT+IGXpyVVBkt4ltfXSecY1pXkuWIkChNBZU/8K5myl+wp5qa4gSCF4OHfYwz2XfejSCpnSGjJmQ==
X-Received: by 2002:a05:6a20:1008:b0:14d:cca3:a100 with SMTP id gs8-20020a056a20100800b0014dcca3a100mr11444815pzc.36.1696337273833;
        Tue, 03 Oct 2023 05:47:53 -0700 (PDT)
Received: from [172.16.116.58] ([103.15.228.93])
        by smtp.gmail.com with ESMTPSA id u11-20020a170902b28b00b001b890009634sm1436879plr.139.2023.10.03.05.47.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Oct 2023 05:47:53 -0700 (PDT)
Message-ID: <706a8f30-847c-2641-aeee-6c4d4692e573@gmail.com>
Date: Tue, 3 Oct 2023 18:17:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Nishanth Menon <nm@ti.com>
References: <20231002182454.211165-1-ayushdevel1325@gmail.com>
 <20231002182454.211165-2-ayushdevel1325@gmail.com>
 <20231003113017.z3yyjscvvinwnyy7@putdown>
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <20231003113017.z3yyjscvvinwnyy7@putdown>
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.60 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.215.169:from];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	URIBL_BLOCKED(0.00)[mail-pg1-f169.google.com:helo,mail-pg1-f169.google.com:rdns,ti.com:url];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 01BA13E9FC
Message-ID-Hash: DEBIR65FQXQGTJNABRJUQ57BVOZBOS37
X-Message-ID-Hash: DEBIR65FQXQGTJNABRJUQ57BVOZBOS37
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vaishnav@beagleboard.org, krzysztof.kozlowski+dt@linaro.org, vigneshr@ti.com, kristo@kernel.org, robh+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v6 1/3] dt-bindings: Add beaglecc1352
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DEBIR65FQXQGTJNABRJUQ57BVOZBOS37/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

>> +
>> +  reset-gpios:
>> +    maxItems: 1
>> +
>> +  power-gpios:
>> +    maxItems: 3
>> +    description:
>> +      The device has three power rails that are exposed on external pins VDDS,
>> +      VDDR and DCOUPL.
> Shouldn't these be regulators? The power rails are input to the MCU,
> correct?
> The properties should be something like:
> vdds-supply
> vddr-supply
> dcoupl-supply ? (not sure what dcoupl is, but description should provide
> 		that info).
>
> the gpio controls for those can be modelled by regulator-gpio ?

I picked up power lines from "CC13xx/CC26xx Hardware Configuration and 
PCB Design Considerations Application Report" present under "8.14 
Network Processor" of CC1352P7 data sheet.

But now looking closer, it doesn't seem like DCOUPL can be supplied 
externally for CC1352P7 and thus should probably be removed.

Also, it seems like for CC1352P7, VDDR must always be supplied 
internally (The data sheet states: "Internal supply, must be powered 
from the internal DC/DC converter or the internal LDO"). Thus, it should 
be safe to remove VDDR as well.


That means only VDDS needs to be present for power line.


CC13xx/CC26xx Hardware Configuration and PCB Design Considerations 
Application Report: https://www.ti.com/lit/pdf/swra640

CC1352P7 Data sheet: https://www.ti.com/lit/gpn/CC1352P7


Sincerely,

Ayush Singh

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
