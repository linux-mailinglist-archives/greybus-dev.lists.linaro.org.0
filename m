Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D51CF35E6
	for <lists+greybus-dev@lfdr.de>; Mon, 05 Jan 2026 12:55:45 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EE9E040154
	for <lists+greybus-dev@lfdr.de>; Mon,  5 Jan 2026 11:55:43 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	by lists.linaro.org (Postfix) with ESMTPS id 1E9AE3F835
	for <greybus-dev@lists.linaro.org>; Mon,  5 Jan 2026 11:55:42 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=IAwB7iWH;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.221.51 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4327555464cso4545072f8f.1
        for <greybus-dev@lists.linaro.org>; Mon, 05 Jan 2026 03:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767614141; x=1768218941; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vGx3PdQLTEGTA/+kl6GC7HNe3VAOwtg1+M0c6+I7tTc=;
        b=IAwB7iWHrqstcmnuLjG8pb2jFhdgVAzjUga2EgqTRKpNty9Jyxu74scjn5BB+VBWUO
         7ZoHKgR/NvlEQuEcgFCdGddpmhtkZ19ZxtHzEiaGZ3IxYfPin/J7o7BXe6EBUVG50ra/
         lDOkqsA/3Nje94JOUwT5YDcW+Z5FsL0sm4lQ8M1H1f9S4uUsJEsZksO2/V4E5IwYc42Z
         UsTxZ1qiUGrYhyjHARRnQLunriTHbYgV04i2zIzLGcJt8WV7G4W8pum0sw+lyuB8nt58
         8zmUkDTrjJtNnAA9iqkx+bLw7i1jMlIL4ACEuG4w5xjhHqpbAU+DjgRCOYyM8a3f00AD
         ADQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767614141; x=1768218941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vGx3PdQLTEGTA/+kl6GC7HNe3VAOwtg1+M0c6+I7tTc=;
        b=iy94+WDSkoU5wY1zfOOJmy12EcqRuZd0oTguCEhpLh5ThMdFxZXH3Qrcr9ipR5Dmtu
         lYgDWFu21Llwj1xXesULFjCmtp8orQNdWoXxtX58odlopeum7TREtwiOUOJYj6/nPNOv
         rC7FJnrqFTLC9KVkX8HXvz8NOPG6VUWZDNYeze7jTnS0bxcgi8vIi8u45Tczp/rLsLh5
         Sg6FzqE3jbEmROYacSslX1W5bNMGijCuchLurp+nrVZaa0JvQOWtjRh4RSfcUs9UK3Ff
         P4pXjQ6nQpetQNkyIdyH6RuyjEpBibc324CSTTdvTV6xtRrUSKTd4F9GB9/E+6ipSRso
         Mt4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUts+uNUnhuwzS20XyOmj0XuBlx6xlj04VV0iy3Je91d+mnSD8nQ+R3+TK/tJ2lm+NZdf13vEEIpsY5hA==@lists.linaro.org
X-Gm-Message-State: AOJu0YzUjogKmS3CUgwn84/ZY1Efxsr+51gzBH5s+4G59tBcH+ES9m8y
	+n4iFUlRarCZFG/rXTPQkzYWqqm3ZgVsi0Z8//DwbkMhxCyaxmpHhacrd7SV7yCWMZsSWA==
X-Gm-Gg: AY/fxX5l40avNbDzVc4wtSPQtxyoUyptBcJrFYwXwND5C73JKaa/xGvaWdLs5PsjKSc
	DjXc2CDh0D5srPBEq60ugIi8kIVTdDYW551/a2wqpDvDWfyUNhbwgGFmbr3QVFcgFIkTVCDeHJh
	FYff1voLZNVD6UggCRcXvBlXKe/UB5ThM6DO7dYw7lpesWvVzS1plftiuB3x02oe1Rum/WaFFSl
	I/yEsoC29FJbGdntIOwV0cphr7qqbWoPdP6CLMsewUwJF2/JE4Z4to9zkLtPeyAHLg/lifzutAu
	yk6sZKbLz9t+nLSD/28R/TP2D7HH7b2sBAhxGP4CMWFVpA3+63FCEqFI4T5RGC45+CxjrXPzc1g
	F2cYhxFhyWCH/cs7F5j8L9ez42agvdF4V46coj+o+HewBJE0pYdPLJ6Z6Zpp6ZDLXRS2ymxNezr
	THBcfZjmKXleEylNWZ
X-Google-Smtp-Source: AGHT+IGunfGijTnOFIiOYIQluYX+LWFj6c3mZY/ErVVGlm6oAL7B2TzSZFepMA4HDe8vleoKeXePyQ==
X-Received: by 2002:a05:6000:230c:b0:430:fd9f:e705 with SMTP id ffacd0b85a97d-4324e4d3e9dmr71274562f8f.27.1767614141040;
        Mon, 05 Jan 2026 03:55:41 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa08efsm100876495f8f.29.2026.01.05.03.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 03:55:40 -0800 (PST)
Date: Mon, 5 Jan 2026 14:55:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sun Jian <sun.jian.kdev@gmail.com>
Message-ID: <aVumucN_RFQwfgj9@stanley.mountain>
References: <20251229112649.137391-1-sun.jian.kdev@gmail.com>
 <20251230012908.214959-1-sun.jian.kdev@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251230012908.214959-1-sun.jian.kdev@gmail.com>
X-Rspamd-Queue-Id: 1E9AE3F835
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[99.98%];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.51:from];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	URIBL_BLOCKED(0.00)[linaro.org:dkim,linaro.org:from_smtp,linaro.org:from_mime,stanley.mountain:mid,mail-wr1-f51.google.com:helo,mail-wr1-f51.google.com:rdns];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,animalcreek.com,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[209.85.221.51:from];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DKIM_TRACE(0.00)[linaro.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: XRI6G2IQ2LETCZGHYXNQC7DLTZ2XJ6V3
X-Message-ID-Hash: XRI6G2IQ2LETCZGHYXNQC7DLTZ2XJ6V3
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, David Laight <david.laight.linux@gmail.com>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3] staging: greybus: audio: avoid snprintf truncation warnings
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XRI6G2IQ2LETCZGHYXNQC7DLTZ2XJ6V3/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This W=1 string truncation warnings always seems like a pointless thing.
dmesg output is really only intended for developers.  I don't even know
how to look at the dmesg on my phone or kindle.  Who cares if the last
character in a really long device name is missing?  I have looked at a
lot of stack traces and I have never once been stymied because one
character was missing in a really long device name.

And also these are 90% false positives.  We just add bounds checking all
of our output to prevent memory corruption and not because we think that
we'll actually hit the boundaries.  And the GCC is not able to analyze
these in a sensible way, it's just going based on the variable types.

This patch makes the code worse (more complicated).

To recap:
1: It's warning about a non-issue.  No one cares about truncated output.
2: The warning is implemented poorly.  High false positive ratio.
3: The fix makes the code worse

Just fix the tool instead of making the code worse for no reason.

regards,
dan carpenter
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
